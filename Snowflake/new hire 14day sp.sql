//drop table PO_HRIS_DB."survey".PO_14DAY_SURVEY;//PO_STAGE_DB."survey".PO_14DAY_SURVEY
select count(*),response_id from "PO_HRIS_DB"."survey".po_new_hire_survey group by 2 having count(*) > 1 ;
SHOW STREAMS  IN po_hris_db."survey";

select * from "PO_HRIS_DB"."survey".po_new_hire_14day_survey group by 2 having count(*) > 1 ;


select * delete from "PO_HRIS_DB"."survey".po_new_hire_14day_survey where response_id = 'R_6SodgGgChUoLxN1' and source_filename = 'outbound/QL_Survey_14_Day_New_Hire_20240124_hashed.csv'
R_6WqlroWSTdlx10l
R_6SodgGgChUoLxN1

CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage
(
Start_Date Varchar(50),
End_Date Varchar(50),
Status Varchar(10),
Progress Varchar(50),
Duration Varchar(50),
Finished Varchar(50),
Recorded_Date Varchar(50),
Response_Id Varchar(50),
Q6 Varchar,
Q8 Varchar(50),
Q10 Varchar,
Q12 Varchar(50),
Q9 Varchar(50),
Q13 Varchar,
Q14_1 Varchar(50),
Q14_2 Varchar(50),
Q14_3 Varchar(50),
Q14_4 Varchar(50),
Q14_5 Varchar(50),
Q14_6 Varchar(50),
Q14_7 Varchar(50),
Q14_7_TEXT Varchar,
Q15 Varchar(50),
Q16 Varchar(50),
Q17 Varchar,
Q20 Varchar(50),
Q21 Varchar(50),
Q22 Varchar(50),
Q23 Varchar(50),
Q25 Varchar(50),
Q27 Varchar(50),
Q28 Varchar(50),
Q29 Varchar,
Q30 Varchar(50),
Q31 Varchar,
Q32 Varchar,
Q34 Varchar(50),
Q33 Varchar,
Q35 Varchar,
Q38 Varchar(50),
Q40 Varchar(50),
Q42 Varchar(50),
Employee_ID Varchar(200),
Last_Update_Timestamp Varchar(50),
Source_Filename Varchar(500)
);

CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_new_hire_14day_survey
(
Record_Date Date,
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Employee_ID Varchar(128),
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Q8 Varchar(30),
Q10 Varchar,
Q12 Varchar(10),
Q9 Varchar(30),
Q13 Varchar,
Q14_1 Varchar(14),
Q14_2 Varchar(14),
Q14_3 Varchar(14),
Q14_4 Varchar(14),
Q14_5 Varchar(14),
Q14_6 Varchar(14),
Q14_7 Varchar(14),
Q14_7_TEXT Varchar,
Q15 Varchar(30),
Q16 Varchar(30),
Q17 Varchar,
Q20 Varchar(30),
Q21 Varchar(30),
Q22 Varchar(30),
Q23 Varchar(30),
Q25 Varchar(30),
Q27 Varchar(30),
Q28 Varchar(30),
Q29 Varchar,
Q30 Varchar(10),
Q31 Varchar,
Q32 Varchar,
Q34 Varchar(40),
Q33 Varchar,
Q35 Varchar,
Q38 Varchar(25),
Q40 Varchar(25),
Q42 Varchar(25),
Source_Filename Varchar(500),
Created_Datetime timestamp_ntz,
Created_By Varchar(100),
Modified_Datetime timestamp_ntz,
Modified_By Varchar(100),
Batch_ID Integer
);
show tasks
/*stream for New Hire14day*/
//truncate table "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage

select * from "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage
;
create or replace pipe PO_STAGE_DB."survey".p_new_hire_14day_survey_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage
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
$10,
$11,
$12,
$13,
$14,
$15,
$16,
$17,
$18,
$19,
$20,
$21,
$22,
$23,
$24,
$25,
$26,
$27,
$28,
$29,
$30,
$31,
$32,
$33,
$34,
$35,
$36,
$37,
$38,
$39,
$40,
$41,
$42,
$43,
$44,
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*QL_Survey_14_Day_New_Hire_.*_hashed.csv'
FILE_FORMAT = (FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

/*stream for New Hire14day*/
create or replace stream PO_STAGE_DB."survey".S_NEW_HIRE_14DAY_SURVEY_LOAD
COPY GRANTS on table "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage
APPEND_ONLY = TRUE
;



/*Task for New Hire14day*/
create or replace task PO_HRIS_DB."survey".t_new_hire_14day_survey_load 
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 16-17 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('"PO_STAGE_DB"."survey".S_NEW_HIRE_14DAY_SURVEY_LOAD')
as 
Call sp_new_hire_14day_survey_load((to_char(current_date -1,'YYYYMMDD') )::int)
;

alter task t_new_hire_14day_survey_load resume;

  select *
  from table(information_schema.task_history()) 
  order by scheduled_time;

select * from "PO_HRIS_DB"."survey".po_new_hire_14day_survey;

/* Store Proc for New Hire14day*/

CREATE OR REPLACE PROCEDURE sp_new_hire_14day_survey_load(Batch_ID int)
  RETURNS VARCHAR
  LANGUAGE SQL
  EXECUTE AS CALLER
  AS
  $$
  
declare
record_date date;
created_datetime timestamp;
modified_datetime timestamp;
created_by string;
modified_by string;



begin


record_date := current_date();
created_datetime := current_timestamp(); 
modified_datetime := current_timestamp(); 
created_by := current_user();
modified_by :=  current_user();

create or replace temp table tmp_newhire_14day as
Select ass.*, row_number() over( partition by response_id order by source_filename desc) as rnk
from "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage ass
;

INSERT INTO "PO_HRIS_DB"."survey".po_new_hire_14day_survey
(
record_Date,
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
Employee_ID,
Q8,
Q10,
Q12,
Q9,
Q13,
Q14_1,
Q14_2,
Q14_3,
Q14_4,
Q14_5,
Q14_6,
Q14_7,
Q14_7_TEXT,
Q15,
Q16,
Q17,
Q20,
Q21,
Q22,
Q23,
Q25,
Q27,
Q28,
Q29,
Q30,
Q31,
Q32,
Q34,
Q33,
Q35,
Q38,
Q40,
Q42,
Source_Filename,
Created_Datetime,
Created_By ,
Modified_Datetime ,
Modified_By ,
Batch_ID 
)

select 
:record_date,
to_timestamp(nhs.Start_Date),
to_timestamp(nhs.End_Date),
nhs.Status,
nhs.Progress,
nhs.Duration,
nhs.Finished,
to_timestamp(nhs.Recorded_Date),
nhs.Response_Id,
nhs.Employee_ID,
nhs.Q8,
nhs.Q10,
nhs.Q12,
nhs.Q9,
nhs.Q13,
nhs.Q14_1,
nhs.Q14_2,
nhs.Q14_3,
nhs.Q14_4,
nhs.Q14_5,
nhs.Q14_6,
nhs.Q14_7,
nhs.Q14_7_TEXT,
nhs.Q15,
nhs.Q16,
nhs.Q17,
nhs.Q20,
nhs.Q21,
nhs.Q22,
nhs.Q23,
nhs.Q25,
nhs.Q27,
nhs.Q28,
nhs.Q29,
nhs.Q30,
nhs.Q31,
nhs.Q32,
nhs.Q34,
nhs.Q33,
nhs.Q35,
nhs.Q38,
nhs.Q40,
nhs.Q42,
nhs.Source_Filename,
:created_datetime ,
:created_by ,
:modified_datetime ,
:modified_by ,
:Batch_ID 
From tmp_newhire_14day nhs
LEFT JOIN "PO_HRIS_DB"."survey".po_new_hire_14day_survey nh on nh.response_id = nhs.response_id 
where nh.response_id is null and nhs.rnk = 1;

Truncate table "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage;

Return 'Done';

  END;
  $$;
