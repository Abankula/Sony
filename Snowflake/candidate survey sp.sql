select * from "PO_HRIS_DB"."survey".po_decline_survey

CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_candidate_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Status Varchar(10),
Progress Varchar(30),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
Response_Id Varchar(30),
Recipient_Email Varchar(150),
External_Reference Varchar(10),
Distribution_Channel Varchar(10),
User_Language Varchar(10),
Q5 Varchar(50),
Q3_NPS_GROUP Varchar(30),
Q3 Varchar(30),
Q7_NPS_GROUP Varchar(30),
Q7 Varchar(30),
Q4 Varchar(30),
Q8 Varchar,
Q9 Varchar(30),
Q10 Varchar(30),
Q12 Varchar(30),
Q11_14_TEXT Varchar(30),
Q13 Varchar(30),
Q14 Varchar(30),
Q15 Varchar(30),
Q16 Varchar(30),
Q17 Varchar(30),
Q18 Varchar(30),
Q19 Varchar(30),
Q20 Varchar(30),
Q21 Varchar(30),
Q22 Varchar(30),
Q23 Varchar(30),
Q24 Varchar(30),
Job_Requisition Varchar(150),
Candidate_ID Varchar(128),
Applied_Date Varchar(20),
Req_ID Varchar(10),
Offer_Date Varchar(20),
Source_Filename Varchar(500)
);

CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_candidate_survey
(
Record_Date Date,
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Recipient_Email Varchar(128),
External_Reference Varchar(10),
Distribution_Channel Varchar(10),
User_Language Varchar(2),
Job_Requisition Varchar(150),
Candidate_ID Varchar(128),
Req_ID Varchar(10),
Applied_Date Date,
Offer_Date Date,
Q5 Varchar(50),
Q3_NPS_GROUP Varchar(30),
Q3 Varchar(30),
Q7_NPS_GROUP Varchar(30),
Q7 Varchar(30),
Q4 Varchar(30),
Q8 Varchar,
Q9 Varchar(30),
Q10 Varchar(30),
Q12 Varchar(30),
Q11_14_TEXT Varchar(30),
Q13 Varchar(30),
Q14 Varchar(30),
Q15 Varchar(30),
Q16 Varchar(30),
Q17 Varchar(30),
Q18 Varchar(30),
Q19 Varchar(30),
Q20 Varchar(30),
Q21 Varchar(30),
Q22 Varchar(30),
Q23 Varchar(30),
Q24 Varchar(30),
Source_Filename Varchar(500),
Created_Datetime timestamp_ntz,
Created_By Varchar(100),
Modified_Datetime timestamp_ntz,
Modified_By Varchar(100),
Batch_ID Integer
);


create or replace pipe PO_STAGE_DB."survey".p_candidate_survey_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."survey".po_candidate_survey_stage
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*QL_Survey_Spe_Candidate_.*_hashed.*csv'
FILE_FORMAT = (FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;



/*stream for candidate_survey*/
create or replace stream PO_STAGE_DB."survey".s_candidate_survey_load
COPY GRANTS on table "PO_STAGE_DB"."survey".po_candidate_survey_stage
APPEND_ONLY = TRUE
;

/*Task for candidate_survey*/
create or replace task PO_HRIS_DB."survey".t_candidate_survey_load
Warehouse = po_wh
Schedule = '1 Minute'
when system$stream_has_data('PO_STAGE_DB."survey".s_candidate_survey_load')
as 
Call sp_candidate_survey_load((to_char(current_date -1,'YYYYMMDD') )::int)
;

/* Store Proc for candidate_survey*/

CREATE OR REPLACE PROCEDURE sp_candidate_survey_load(Batch_ID int)
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



INSERT INTO "PO_HRIS_DB"."survey".po_candidate_survey

(
Record_Date,
Start_Date ,
End_Date ,
Status ,
Progress ,
Duration ,
Finished ,
Recorded_Date ,
Response_Id ,
Recipient_Email ,
External_Reference ,
Distribution_Channel ,
User_Language ,
Q5 ,
Q3_NPS_GROUP ,
Q3 ,
Q7_NPS_GROUP ,
Q7 ,
Q4 ,
Q8 ,
Q9 ,
Q10 ,
Q12 ,
Q11_14_TEXT ,
Q13 ,
Q14 ,
Q15 ,
Q16 ,
Q17 ,
Q18 ,
Q19 ,
Q20 ,
Q21 ,
Q22 ,
Q23 ,
Q24 ,
Job_Requisition ,
Candidate_ID ,
Applied_Date ,
Req_ID ,
Offer_Date ,
Source_Filename ,
Created_Datetime,
Created_By ,
Modified_Datetime ,
Modified_By ,
Batch_ID 
)

select 
:record_date,
to_timestamp(nhs.Start_Date) ,
to_timestamp(nhs.End_Date) ,
nhs.Status ,
nhs.Progress ,
nhs.Duration ,
nhs.Finished ,
to_timestamp(nhs.Recorded_Date) ,
nhs.Response_Id ,
nhs.Recipient_Email ,
nhs.External_Reference ,
nhs.Distribution_Channel ,
nhs.User_Language ,
nhs.Q5 ,
nhs.Q3_NPS_GROUP ,
nhs.Q3 ,
nhs.Q7_NPS_GROUP ,
nhs.Q7 ,
nhs.Q4 ,
nhs.Q8 ,
nhs.Q9 ,
nhs.Q10 ,
nhs.Q12 ,
nhs.Q11_14_TEXT ,
nhs.Q13 ,
nhs.Q14 ,
nhs.Q15 ,
nhs.Q16 ,
nhs.Q17 ,
nhs.Q18 ,
nhs.Q19 ,
nhs.Q20 ,
nhs.Q21 ,
nhs.Q22 ,
nhs.Q23 ,
nhs.Q24 ,
nhs.Job_Requisition ,
nhs.Candidate_ID ,
nhs.Applied_Date ,
nhs.Req_ID ,
nhs.Offer_Date ,
nhs.Source_Filename ,
:created_datetime ,
:created_by ,
:modified_datetime ,
:modified_by ,
:Batch_ID 
From "PO_STAGE_DB"."survey".po_candidate_survey_stage nhs
LEFT JOIN "PO_HRIS_DB"."survey".po_candidate_survey nh on nh.response_id = nhs.response_id 
where nh.response_id is null;

Truncate table "PO_STAGE_DB"."survey".po_candidate_survey_stage;

Return 'Done';

  END;
  $$;