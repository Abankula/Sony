Use  PO_HRIS_DB."ld"; 
Use Role ACCOUNTADMIN;
//select * from "PO_STAGE_DB"."ld".po_hmm_stage
CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_hmm_stage
(
Content_Name Varchar(1000),
Employee_User_Name Varchar(128),
Employee_Email Varchar(128),
Visit_Count Varchar(100),
Assessment_Score Varchar(100),
Completed_Date Varchar(100),
Region Varchar(100),
Division Varchar(100),
Department Varchar(500),
Source_Filename Varchar(500)

);
//truncate table 

select max(source_filename) from "PO_HRIS_DB"."ld".po_hmm;

select * from "PO_STAGE_DB"."ld".po_hmm_stage;

create table "PO_HRIS_DB"."ld".po_hmm_bkp20240221 as

//validation 
select count(*),employee_email,content_name from "PO_HRIS_DB"."ld".po_hmm where expiration_date = '9999-12-31' group by 2,3 having count(*) > 1;

select count(*),employee_email,content_name from "PO_HRIS_DB"."ld".po_hmm  group by 2,3 having count(*) > 1;

select *  from "PO_HRIS_DB"."ld".po_hmm 
where Employee_Email='4429f1a706c817b1dbcbd03ae8b45374f1f9e875b695f1de49e6980098599a9804f35346d74fb9e2ae5b8c5190b9f7041eacb9947582cc144a3008f9147016db' and content_name = 'Meeting Management' and expiration_date <> '9999-12-31' and source_filename = 'outbound/HMM_20240123000000_hashed.csv';

981eb78061f09a8258886fb8d52a8dc5930e5f645889dbb453d85f750993d8dc29c71a52b629a86f79d82dfaedd99244225177e15849892a1d6a4d6a1a04a9d8
060554a08ec5f28e239521532f005fad2430bfc2cd3f1e510f1cc8165587d01d0b1802050aba2a642b28a93c06f201e032213341d4b766da8777e1093fef8918
4429f1a706c817b1dbcbd03ae8b45374f1f9e875b695f1de49e6980098599a9804f35346d74fb9e2ae5b8c5190b9f7041eacb9947582cc144a3008f9147016db


CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_hmm
(
Content_Name Varchar(500),
Employee_User_Name Varchar(128),
Employee_Email Varchar(128),
Effective_Date Date,
Expiration_Date Date,
Visit_Count Number(3,0),
Assessment_Score Number(3,0),
Completed_Dt timestamp_ntz,
Region Varchar(20),
Division Varchar(100),
Department Varchar(500),
Source_Filename Varchar(500),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modified_By Varchar(100),
Batch_ID Integer
);

create or replace pipe PO_STAGE_DB."ld".p_hmm_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."ld".po_hmm_stage
from (select 
$1,
$2,
$3,
$4,
$5,
$6,
$7,
$8,
$9,
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE )
pattern = '.*HMM_.*20240221000000_hashed.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format_pipe'  TYPE = CSV ) 
;

HMM_20240221000000_hashed.csv


/*stream for hmm*/
create or replace stream "PO_STAGE_DB"."ld".S_HMM_LOAD
COPY GRANTS on table "PO_STAGE_DB"."ld".po_hmm_stage
APPEND_ONLY = TRUE
;

/*Task for hmm*/
create or replace task "PO_HRIS_DB"."ld".t_hmm_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 9-10 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('PO_STAGE_DB."ld".S_HMM_LOAD')
as 
Call sp_hmm_load((to_char(current_date -1,'YYYYMMDD') )::int)
;

alter task "PO_HRIS_DB"."ld".t_hmm_load resume;

show tasks;
show streams
;

CREATE OR REPLACE PROCEDURE "PO_HRIS_DB"."ld".sp_hmm_load(Batch_ID int)
  RETURNS VARCHAR
  LANGUAGE SQL
  AS
  $$
  
declare
Record_Date date;
Created_Datetime timestamp;
Modified_Datetime timestamp;
Created_By string;
Modified_By string;



begin

Record_Date := current_date();
Created_Datetime := current_timestamp(); 
Modified_Datetime := current_timestamp(); 
Created_By := current_user();
Modified_By :=  current_user();


create or replace temp table tt_hmm_rk  as
Select Content_Name,
Employee_User_Name ,
Employee_Email ,
Visit_Count ,
Assessment_Score ,
Completed_Date::datetime as Completed_Date,
Region,
Division,
Department,
Source_Filename from (Select hs.*,Row_Number() Over (partition by hs.employee_email,hs.content_name order by hs.SOURCE_FILENAME desc) rk
from "PO_STAGE_DB"."ld".po_hmm_stage hs ) a where rk =1
;


create or replace temp table tt_hmm_stg  as
Select hs.*, case when h.Employee_Email is null then 'i' 
when ((h.visit_count <> hs.visit_count) or (h.Assessment_Score<>hs.Assessment_Score) or (h.Completed_Dt<>hs.Completed_Date)) then 'u'
else 'd' end as action,
:Record_Date as Eff_dt,
'9999-12-31' as Exp_dt
from tt_hmm_rk hs 
left join "PO_HRIS_DB"."ld".po_hmm h
on h.Employee_Email = hs.Employee_Email and h.content_name = hs.content_name 
;

update  "PO_HRIS_DB"."ld".po_hmm h
set expiration_date = current_date-1,
Modified_By = :Modified_By ,
modified_date = :Modified_Datetime
from(select * from tt_hmm_stg where action = 'u') hs
where h.Employee_Email = hs.Employee_Email and h.content_name = hs.content_name 
;


INSERT INTO "PO_HRIS_DB"."ld".po_hmm
(
Content_Name,
Employee_User_Name ,
Employee_Email ,
Effective_Date ,
Expiration_Date,
Visit_Count ,
Assessment_Score ,
Completed_Dt,
Region,
Division,
Department,
Source_Filename,
Created_Date,
Created_By,
Modified_Date,
Modified_By,
Batch_ID 
)
Select 
Content_Name,
Employee_User_Name ,
Employee_Email ,
Eff_dt,
Exp_dt,
Visit_Count ,
Assessment_Score ,
Completed_Date,
Region,
Division,
Department,
Source_Filename,
:Created_Datetime,
:Created_By ,
:Modified_Datetime ,
:Modified_By ,
:Batch_ID 
From tt_hmm_stg where action <> 'd' ;

truncate table "PO_STAGE_DB"."ld".po_hmm_stage;

Return 'Done';

  END;
  $$;