select count(*),response_id from "PO_HRIS_DB"."survey".po_new_hire_survey group by 2 having count(*) > 1 ;

//truncate table "PO_STAGE_DB"."survey".po_new_hire_survey_stage;
create or replace pipe PO_STAGE_DB."survey".p_new_hire_survey_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."survey".po_new_hire_survey_stage
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*QL_Survey_New_Hire_3_Month_.*_hashed.*csv'
FILE_FORMAT = (FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;


SELECT SYSTEM$STREAM_HAS_DATA('po_new_hire_survey_stage');


/*stream for exit*/
create or replace stream "PO_STAGE_DB"."survey".S_NEW_HIRE_SURVEY_LOAD
COPY GRANTS on table "PO_STAGE_DB"."survey".po_new_hire_survey_stage
APPEND_ONLY = TRUE
;
alter task t_new_hire_survey_load resume;

/*Task for Newhire*/
create or replace task PO_HRIS_DB."survey".t_new_hire_survey_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 16-17 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('"PO_STAGE_DB"."survey"."S_NEW_HIRE_SURVEY_LOAD"')
as 
Call sp_new_hire_load((to_char(current_date -1,'YYYYMMDD') )::int)
;
truncate table "PO_STAGE_DB"."survey".po_new_hire_survey_stage

select *
  from table(information_schema.task_history())
  order by scheduled_time;
  
show tasks

alter task PO_HRIS_DB."survey".t_new_hire_survey_load resume;
alter task PO_HRIS_DB."survey".t_new_hire_survey_load suspend;
select * from "PO_HRIS_DB"."survey".po_new_hire_survey;

select * from "PO_STAGE_DB"."survey".po_new_hire_survey_stage

CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_new_hire_survey_stage
(
Start_Date Varchar,
End_Date Varchar,
Status Varchar,
Progress Varchar,
Duration Varchar,
Finished Varchar,
Recorded_Date Varchar,
Response_Id Varchar,
Q2 Varchar,
Q4 Varchar,
Q5 Varchar,
Q6 Varchar,
Q7 Varchar,
Q8 Varchar,
Q9 Varchar,
Q10 Varchar,
Q11 Varchar,
Q12 Varchar,
Q13 Varchar,
Q14 Varchar,
Q15 Varchar,
Q16 Varchar,
Q18 Varchar,
Q20 Varchar,
Q19 Varchar,
Q21 Varchar,
Q22 Varchar,
Q23 Varchar,
Q24 Varchar,
Q25 Varchar,
Q26 Varchar,
Q27 Varchar,
Q28 Varchar,
Hire_Date Varchar,
Employee_ID Varchar,
Participant_Unique_Identifier Varchar,
Filename Varchar
);


select * 
from 
"PO_HRIS_DB"."survey".po_new_hire_survey


CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_new_hire_survey
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
Hire_Date Date,
Q2 Varchar,
Q4 Varchar,
Q5 Varchar,
Q6 Varchar,
Q7 Varchar,
Q8 Varchar,
Q9 Varchar,
Q10 Varchar,
Q11 Varchar,
Q12 Varchar,
Q13 Varchar,
Q14 Varchar,
Q15 Varchar,
Q16 Varchar,
Q18 Varchar,
Q20 Varchar,
Q19 Varchar,
Q21 Varchar,
Q22 Varchar,
Q23 Varchar,
Q24 Varchar,
Q25 Varchar,
Q26 Varchar,
Q27 Varchar,
Q28 Varchar,
Source_Filename Varchar (100),
Created_Datetime timestamp_ntz,
Created_By Varchar(100),
Modified_Datetime timestamp_ntz,
Modified_By Varchar(100),
Batch_ID Integer
)

;



call "PO_HRIS_DB"."survey".sp_exit_newhire_load (20231016);



select * from   "PO_HRIS_DB"."survey".po_new_hire_survey;

DROP PROCEDURE PO_HRIS_DB."survey".MY_STORED_PROCEDURE()

PO_HRIS_DB."survey".MY_STORED_PROCEDURE

SP_EXIT_SURVEY_LOAD(NUMBER,NUMBER);

CREATE OR REPLACE PROCEDURE sp_new_hire_load(Batch_ID int)
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

create or replace temp table tmp_newhire as
Select ass.*, row_number() over( partition by response_id order by filename desc) as rnk
from "PO_STAGE_DB"."survey".po_new_hire_survey_stage ass
;


/*

INSERT INTO "PO_STAGE_DB"."survey".po_new_hire_survey_stage
(
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
Q2,
Q4,
Q5,
Q6,
Q7,
Q8,
Q9,
Q10,
Q11,
Q12,
Q13,
Q14,
Q15,
Q16,
Q18,
Q20,
Q19,
Q21,
Q22,
Q23,
Q24,
Q25,
Q26,
Q27,
Q28,
Employee_ID,
Hire_Date,
Participant_Unique_Identifier,
Filename
)

select 
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
METADATA$FILENAME
from @"PO_STAGE_DB"."Worker".worker_load_instg/Newhire.csv (file_format => 'csv_load_format' ) t;
*/

INSERT INTO "PO_HRIS_DB"."survey".po_new_hire_survey

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
Q2,
Q4,
Q5,
Q6,
Q7,
Q8,
Q9,
Q10,
Q11,
Q12,
Q13,
Q14,
Q15,
Q16,
Q18,
Q20,
Q19,
Q21,
Q22,
Q23,
Q24,
Q25,
Q26,
Q27,
Q28,
Employee_ID,
Hire_Date,
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
nhs.Q2,
nhs.Q4,
nhs.Q5,
nhs.Q6,
nhs.Q7,
nhs.Q8,
nhs.Q9,
nhs.Q10,
nhs.Q11,
nhs.Q12,
nhs.Q13,
nhs.Q14,
nhs.Q15,
nhs.Q16,
nhs.Q18,
nhs.Q20,
nhs.Q19,
nhs.Q21,
nhs.Q22,
nhs.Q23,
nhs.Q24,
nhs.Q25,
nhs.Q26,
nhs.Q27,
nhs.Q28,
coalesce(nhs.Employee_ID,nhs.Participant_Unique_Identifier) as Employee_ID,
nhs.Hire_Date,
nhs.Filename,
:created_datetime ,
:created_by ,
:modified_datetime ,
:modified_by ,
:Batch_ID 
From tmp_newhire nhs
LEFT JOIN "PO_HRIS_DB"."survey".po_new_hire_survey nh on nh.response_id = nhs.response_id 
where nh.response_id is null and nhs.rnk =1;

Truncate table "PO_STAGE_DB"."survey".po_new_hire_survey_stage;

Return 'Done';

  END;
  $$;