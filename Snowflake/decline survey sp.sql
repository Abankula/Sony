CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_decline_survey
(
Record_Date Date,
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(100),
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Distribution_Channel Varchar(10),
User_Language Varchar(2),
Participant_Email Varchar(100),
Q2_14_Text Varchar,
Q3 Varchar(200),
Q3_14_Text Varchar,
Q4 Varchar,
Q5 Varchar(10),
Q6 Varchar(100),
Q8_NPS_Category Varchar(10),
Q8 Number,
Q7 Varchar,
Source_Filename Varchar(500),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;
 select * From "PO_STAGE_DB"."survey".po_decline_survey_stage nhs
CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_decline_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Status Varchar(30),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
Response_Id Varchar(30),
Distribution_Channel Varchar(10),
User_Language Varchar(2),
Q2_14_Text Varchar,
Q3 Varchar(200),
Q3_14_Text Varchar,
Q4 Varchar,
Q5 Varchar(10),
Q6 Varchar(100),
Q8_NPS_Category Varchar(10),
Q8 Varchar(10),
Q7 Varchar,
Source_Filename Varchar(500)
)
;
create or replace pipe PO_STAGE_DB."survey".p_decline_survey_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."survey".po_decline_survey_stage
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*QL_Survey_Offer_.*_hashed.*csv'
FILE_FORMAT = (FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

/*stream for candidate_survey*/
create or replace stream PO_STAGE_DB."survey".s_decline_survey_load
COPY GRANTS on table "PO_STAGE_DB"."survey".po_decline_survey_stage
APPEND_ONLY = TRUE
;

/*Task for candidate_survey*/
create or replace task PO_HRIS_DB."survey".t_decline_survey_load
Warehouse = po_wh
Schedule = '1 Minute'
when system$stream_has_data('PO_STAGE_DB."survey".s_decline_survey_load')
as 
Call sp_decline_survey_load((to_char(current_date -1,'YYYYMMDD') )::int)
;
show tasks

/* Store Proc for candidate_survey*/

CREATE OR REPLACE PROCEDURE sp_decline_survey_load(Batch_ID int)
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



INSERT INTO "PO_HRIS_DB"."survey".po_decline_survey

(
Record_Date,
Start_Date,
End_Date,
Status,
Duration,
Finished,
Recorded_Date,
Response_Id,
Distribution_Channel,
User_Language,
Q2_14_Text,
Q3,
Q3_14_Text,
Q4,
Q5,
Q6,
Q8_NPS_Category,
Q8,
Q7,
Source_Filename,
Created_Date,
Created_By,
Modified_Date,
Modifeid_By,
Batch_ID
)

select 
:record_date,
to_timestamp(nhs.Start_Date) ,
to_timestamp(nhs.End_Date) ,
nhs.Status ,
nhs.Duration,
nhs.Finished,
to_timestamp(nhs.Recorded_Date),
nhs.Response_Id,
nhs.Distribution_Channel,
nhs.User_Language,
nhs.Q2_14_Text,
nhs.Q3,
nhs.Q3_14_Text,
nhs.Q4,
nhs.Q5,
nhs.Q6,
nhs.Q8_NPS_Category,
nhs.Q8,
nhs.Q7,
nhs.Source_Filename ,
:created_datetime ,
:created_by ,
:modified_datetime ,
:modified_by ,
:Batch_ID 
From "PO_STAGE_DB"."survey".po_decline_survey_stage nhs
LEFT JOIN "PO_HRIS_DB"."survey".po_decline_survey nh on nh.response_id = nhs.response_id 
where nh.response_id is null;

Truncate table "PO_STAGE_DB"."survey".po_decline_survey_stage;

Return 'Done';

  END;
  $$;

