put file://C:\Users\abankula\Documents\Snapshot\Exit*.csv @"Worker".worker_load_instg AUTO_COMPRESS=false SOURCE_COMPRESSION=NONE OVERWRITE=TRUE;
                                                       
//DROP PROCEDURE PO_STAGE_DB."Worker".SP_ANNIVERSARY_SURVEY_LOAD(NUMBER)

remove @worker_Load_instg ;
select response_id,ws.hierarchy_l1,ws.hierarchy_l2,ws.hierarchy_l3,ws.hierarchy_l4,ws.hierarchy_l4,ws.hierarchy_l5,ws.hierarchy_l6,ws.hierarchy_l7,ws.hierarchy_l8,ws.hierarchy_l9,ws.hierarchy_l10 from "PO_HRIS_DB"."Worker".po_worker_snapshot ws inner join (select * from "PO_HRIS_DB"."survey".po_anniversary_survey where response_id In ('R_3QXWmBskaBJOoLM',
'R_1r1ggqLkNkg6jck',
'R_3G1cMQjrr4SiZME',
'R_UXXbTsESXyQMA2R',
'R_2rH4WsvAPe5fdfu',
'R_0ooT5FLQdlKbK6J',
'R_3PB5GB65uGiMftG',
'R_2X66Z4pVVTRRZNU',
'R_2feAdsnYCfMaXn6',
'R_1j6pH81DJJeyC7u',
'R_2pRhxjpEdzJgTdC',
'R_0eb5PH1nY1aYUDf',
'R_1IZechGqBYbPSqy',
'R_3ptM4dYo8X8GFg4',
'R_1LtUAUcf4EiMTJQ',
'R_3kjDVUCD4H9rFYi',
'R_2Xbs8UIu6jv9aRD',
'R_3GADhX2LUwkZler',
'R_1rHSLgKgAVASyrF',
'R_1IykUPTqy0N0Ux7',
'R_1IQVm6UGPNEt1Qd',
'R_sRJSZS3dzepikUx',
'R_1g6Ctl94efUep6e',
'R_5tZ6li1PUBneypb',
'R_2pVLJdP8pWJ7aMt',
'R_3jVEBagJPO074wv',
'R_12SEUsG0RAYxBaL',
'R_2fr4ezE9hmgo1pL',
'R_3MR42KMKF0yDxgH',
'R_2pWzdSaY9kzA9Wz'
))a on ws.employee_id = a.employee_id;



where snapshot_dt = '2022-12-31' limit 10;
select max(record_date) from "PO_HRIS_DB"."survey".po_anniversary_survey where response_id In ('R_3QXWmBskaBJOoLM',
'R_1r1ggqLkNkg6jck',
'R_3G1cMQjrr4SiZME',
'R_UXXbTsESXyQMA2R',
'R_2rH4WsvAPe5fdfu',
'R_0ooT5FLQdlKbK6J',
'R_3PB5GB65uGiMftG',
'R_2X66Z4pVVTRRZNU',
'R_2feAdsnYCfMaXn6',
'R_1j6pH81DJJeyC7u',
'R_2pRhxjpEdzJgTdC',
'R_0eb5PH1nY1aYUDf',
'R_1IZechGqBYbPSqy',
'R_3ptM4dYo8X8GFg4',
'R_1LtUAUcf4EiMTJQ',
'R_3kjDVUCD4H9rFYi',
'R_2Xbs8UIu6jv9aRD',
'R_3GADhX2LUwkZler',
'R_1rHSLgKgAVASyrF',
'R_1IykUPTqy0N0Ux7',
'R_1IQVm6UGPNEt1Qd',
'R_sRJSZS3dzepikUx',
'R_1g6Ctl94efUep6e',
'R_5tZ6li1PUBneypb',
'R_2pVLJdP8pWJ7aMt',
'R_3jVEBagJPO074wv',
'R_12SEUsG0RAYxBaL',
'R_2fr4ezE9hmgo1pL',
'R_3MR42KMKF0yDxgH',
'R_2pWzdSaY9kzA9Wz'
);

select * from PO_HRIS_DB."survey".PO_EXIT_SURVEY;

//select * from PO_HRIS_DB."survey".PO_CANDIDATE_SURVEY;

//select * from PO_HRIS_DB."survey".PO_DECLINE_SURVEY;

//select * from PO_HRIS_DB."survey".PO_NEW_HIRE_SURVEY

select * from PO_HRIS_DB."survey".PO_NEW_HIRE_14DAY_SURVEY

CREATE OR REPLACE FILE FORMAT csv_no_skip
TYPE = 'CSV'
COMPRESSION = AUTO 
file_extension = '.csv'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1
PARSE_HEADER = TRUE
ALLOW_DUPLICATE = TRUE
   --TRIM_SPACE = TRUE
  ;
CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_anniversary_survey
(
Record_Date Date,
  Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(17),
eNPS_EMP Varchar(30),
eNPS_MOV Varchar(30),
eNPS_TV Varchar(30),
Anniversary_Date Date,
Employee_ID Varchar(128),
Fiscal_Year Varchar(20),
FY_Quarter Varchar(20),
Q1_1 Varchar(30),
Q1_2 Varchar(30),
Q1_3 Varchar(30),
Q1_4 Varchar(30),
Q1_5 Varchar(30),
Q1_6 Varchar(30),
Q1_7 Varchar(30),
Q2_1 Varchar(30),
Q2_2 Varchar(30),
Q2_3 Varchar(30),
Q2_4 Varchar(30),
Q2_5 Varchar(30),
Q2_6 Varchar(30),
Q2_7 Varchar(30),
Q2_8 Varchar(30),
Q5_1 Varchar(30),
Q5_2 Varchar(30),
Q5_3 Varchar(30),
Q5_4 Varchar(30),
Q5_5 Varchar(30),
Q5_6 Varchar(30),
Q6_1 Varchar(30),
Q6_2 Varchar(30),
Q6_3 Varchar(30),
Q6_4 Varchar(30),
Q6_5 Varchar(30),
Q6_6 Varchar(30),
Q6_7 Varchar(30),
Q7_1 Varchar(30),
Q7_2 Varchar(30),
Q7_3 Varchar(30),
Q7_4 Varchar(30),
Q7_5 Varchar(30),
Q7_6 Varchar(30),
Q8_1 Varchar(30),
Q8_2 Varchar(30),
Q8_3 Varchar(30),
Q8_4 Varchar(30),
Q8_5 Varchar(30),
Q8_6 Varchar(30),
Q3_1 Varchar(30),
Q3_2 Varchar(30),
Q3_3 Varchar(30),
Q3_4 Varchar(30),
Q3_5 Varchar(30),
Q3_6 Varchar(30),
Q3_7 Varchar(30),
Q4 Varchar,
Q73 Varchar,
Q74 Varchar,
Q75 Varchar,
Source_Filename Varchar (100),
Created_Datetime timestamp_ntz,
Created_By Varchar(100),
Modified_Datetime timestamp_ntz,
Modified_By Varchar(100),
Batch_ID Integer
);



CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_anniversary_survey_stage
(  
Start_Date Varchar(20),
End_Date Varchar(20),
Status Varchar(10),
Progress Varchar(10),
Duration Varchar(10),
Finished Varchar(10),
Recorded_Date Varchar(20),
Response_Id Varchar(20),
eNPS_EMP Varchar(30),
eNPS_MOV Varchar(30),
eNPS_TV Varchar(30),
Q1_1 Varchar(30),
Q1_2 Varchar(30),
Q1_3 Varchar(30),
Q1_4 Varchar(30),
Q1_5 Varchar(30),
Q1_6 Varchar(30),
Q1_7 Varchar(30),
Q2_1 Varchar(30),
Q2_2 Varchar(30),
Q2_3 Varchar(30),
Q2_4 Varchar(30),
Q2_5 Varchar(30),
Q2_6 Varchar(30),
Q2_7 Varchar(30),
Q2_8 Varchar(30),
Q5_1 Varchar(30),
Q5_2 Varchar(30),
Q5_3 Varchar(30),
Q5_4 Varchar(30),
Q5_5 Varchar(30),
Q5_6 Varchar(30),
Q6_1 Varchar(30),
Q6_2 Varchar(30),
Q6_3 Varchar(30),
Q6_4 Varchar(30),
Q6_5 Varchar(30),
Q6_6 Varchar(30),
Q6_7 Varchar(30),
Q7_1 Varchar(30),
Q7_2 Varchar(30),
Q7_3 Varchar(30),
Q7_4 Varchar(30),
Q7_5 Varchar(30),
Q7_6 Varchar(30),
Q8_1 Varchar(30),
Q8_2 Varchar(30),
Q8_3 Varchar(30),
Q8_4 Varchar(30),
Q8_5 Varchar(30),
Q8_6 Varchar(30),
Q3_1 Varchar(30),
Q3_2 Varchar(30),
Q3_3 Varchar(30),
Q3_4 Varchar(30),
Q3_5 Varchar(30),
Q3_6 Varchar(30),
Q3_7 Varchar(30),
Q4 Varchar(),
Q73 Varchar(),
Q74 Varchar(),
Q75 Varchar(),
Anniversary_Date Varchar(10),
Employee_ID Varchar(128),
Participant_Unique_Identifier Varchar(128),
Fiscal_Year Varchar(20),
FY_Quarter Varchar(20),
eNPS_Category Varchar(20),
eNPS_Movie_Category Varchar(20),
eNPS_TV_Category Varchar(20),
Source_Filename Varchar(500)
//Filename Varchar(100)
);



call sp_anniversary_survey_load (20231012);

select count(*) from "PO_HRIS_DB"."survey".po_anniversary_survey ;-3744

select count(* ),response_id from "PO_HRIS_DB"."survey".po_anniversary_survey group by 2 having count(*) > 1 ;-3744

truncate table "PO_HRIS_DB"."survey".po_anniversary_survey 
select max(batch_id) from "PO_HRIS_DB"."survey".po_anniversary_survey  where response_id = 'R_2anVWTTo2oSVsqO'

select * from "PO_STAGE_DB"."survey".po_anniversary_survey_stage

truncate table "PO_HRIS_DB"."survey".po_anniversary_survey ;
truncate table "PO_STAGE_DB"."survey".po_anniversary_survey_stage

"PO_HRIS_DB"."survey".po_exit_survey ;



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

select system$stream_has_data(


SELECT CURRENT_VERSION()
show tasks
show streams
alter task t_anniversary_survey_load resume;
alter task t_anniversary_survey_load suspend;

ALTER STREAM S_ANNIVERSARY_SURVEY_LOAD DISABLE;
ALTER STREAM <stream_name> ENABLE;

SELECT * FROM S_ANNIVERSARY_SURVEY_LOAD;



select *
  from table(information_schema.task_history(ERROR_ONLY =>  TRUE))
  order by scheduled_time;

  select *
  from table(information_schema.task_history()) 
  order by scheduled_time;


  select *
  from table(information_schema.serverless_task_history(
   ));

  select * from PO_HRIS_DB."Application".PO_WD_REQUISITION where requisition_id = 'JR22-10029'
  
   select distinct source_filename from  PO_HRIS_DB."Application".PO_WD_CANDIDATE ;
   
   where requisition_id = 'JR22-10029' limit 1 where upper(offer_manager) like '%MEECHAM%'

   select count(*) from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG

  SQL compilation error: Invalid value ['PO_STAGE_DB."survey".s_new_hire_14day_survey_load '] for function 'SYSTEM$STREAM_HAS_DATA', parameter 1: must be a valid stream name
