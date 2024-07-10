
create or replace pipe PO_STAGE_DB."survey".p_anniversary_survey_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."survey".po_anniversary_survey_stage
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
$45,
$46,
$47,
$48,
$49,
$50,
$51,
$52,
$53,
$54,
$55,
$56,
$57,
$58,
$59,
$60,
$61,
$62,
$63,
$64,
$65,
$66,
$67,
$68,
$69,
$70,
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*QL_Survey_Anniversary_.*_hashed.*csv'
FILE_FORMAT = (FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

2024-01-24 23:34:37.060 -0800
/*stream for exit*/
create or replace stream PO_STAGE_DB."survey".S_ANNIVERSARY_SURVEY_LOAD
COPY GRANTS on table "PO_STAGE_DB"."survey".po_anniversary_survey_stage
APPEND_ONLY = TRUE
;

/*Task for Exit*/
create or replace task PO_HRIS_DB."survey".t_anniversary_survey_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 16-17 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('PO_STAGE_DB."survey".S_ANNIVERSARY_SURVEY_LOAD')
as 
Call sp_anniversary_survey_load((to_char(current_date -1,'YYYYMMDD') )::int)
;


SELECT CURRENT_VERSION()
show tasks
show streams
alter task t_anniversary_survey_load resume;
alter task t_anniversary_survey_load suspend;

select *
  from table(information_schema.task_history(ERROR_ONLY =>  TRUE))
  order by scheduled_time;

  select *
  from table(information_schema.task_history()) 
  order by scheduled_time;

  
CREATE OR REPLACE PROCEDURE "PO_HRIS_DB"."survey".sp_anniversary_survey_load(Batch_ID int)
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

//temp table

create or replace temp table tmp_anniv as
Select ass.*, row_number() over( partition by response_id order by source_filename desc) as rnk
from "PO_STAGE_DB"."survey".po_anniversary_survey_stage ass
;

// Data load from staging to Final database

INSERT INTO "PO_HRIS_DB"."survey".po_anniversary_survey
(
Record_Date,
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
eNPS_EMP,
eNPS_MOV,
eNPS_TV,
Anniversary_Date,
Employee_ID,
Fiscal_Year,
FY_Quarter,
Q1_1,
Q1_2,
Q1_3,
Q1_4,
Q1_5,
Q1_6,
Q1_7,
Q2_1,
Q2_2,
Q2_3,
Q2_4,
Q2_5,
Q2_6,
Q2_7,
Q2_8,
Q5_1,
Q5_2,
Q5_3,
Q5_4,
Q5_5,
Q5_6,
Q6_1,
Q6_2,
Q6_3,
Q6_4,
Q6_5,
Q6_6,
Q6_7,
Q7_1,
Q7_2,
Q7_3,
Q7_4,
Q7_5,
Q7_6,
Q8_1,
Q8_2,
Q8_3,
Q8_4,
Q8_5,
Q8_6,
Q3_1,
Q3_2,
Q3_3,
Q3_4,
Q3_5,
Q3_6,
Q3_7,
Q4,
Q73,
Q74,
Q75,
Source_Filename,
Created_Datetime ,
Created_By,
Modified_Datetime ,
Modified_By,
Batch_ID 
)
select 
:Record_date,
to_timestamp(ans.Start_Date),
to_timestamp(ans.End_Date),
ans.Status,
ans.Progress,
ans.Duration,
ans.Finished,
to_timestamp(ans.Recorded_Date),
ans.Response_Id,
ans.eNPS_EMP,
ans.eNPS_MOV,
ans.eNPS_TV,
ans.Anniversary_Date,
ans.Employee_ID,
ans.Fiscal_Year,
ans.FY_Quarter,
ans.Q1_1,
ans.Q1_2,
ans.Q1_3,
ans.Q1_4,
ans.Q1_5,
ans.Q1_6,
ans.Q1_7,
ans.Q2_1,
ans.Q2_2,
ans.Q2_3,
ans.Q2_4,
ans.Q2_5,
ans.Q2_6,
ans.Q2_7,
ans.Q2_8,
ans.Q5_1,
ans.Q5_2,
ans.Q5_3,
ans.Q5_4,
ans.Q5_5,
ans.Q5_6,
ans.Q6_1,
ans.Q6_2,
ans.Q6_3,
ans.Q6_4,
ans.Q6_5,
ans.Q6_6,
ans.Q6_7,
ans.Q7_1,
ans.Q7_2,
ans.Q7_3,
ans.Q7_4,
ans.Q7_5,
ans.Q7_6,
ans.Q8_1,
ans.Q8_2,
ans.Q8_3,
ans.Q8_4,
ans.Q8_5,
ans.Q8_6,
ans.Q3_1,
ans.Q3_2,
ans.Q3_3,
ans.Q3_4,
ans.Q3_5,
ans.Q3_6,
ans.Q3_7,
ans.Q4,
ans.Q73,
ans.Q74,
ans.Q75,
ans.Source_Filename,
:Created_Datetime,
:Created_By ,
:Modified_Datetime ,
:Modified_By ,
:Batch_ID 
from tmp_anniv ans LEFT JOIN "PO_HRIS_DB"."survey".po_anniversary_survey an on an.response_id = ans.response_id 
where an.response_id is null and ans.Rnk = 1;

Truncate table "PO_STAGE_DB"."survey".po_anniversary_survey_stage;

Return 'Done';

  END;
  $$;