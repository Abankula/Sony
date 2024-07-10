create or replace pipe PO_STAGE_DB."survey".p_survey_participant
auto_ingest = true 
as
copy into "PO_STAGE_DB"."survey".po_decline_survey_stage
from (select 
$1,
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*QL_Survey_Offer_.*_hashed.*csv'
FILE_FORMAT = (FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

select * from PO_HRIS_DB."survey".PO_SURVEY_PARTICIPANT;



select ((to_char(current_date -1,'YYYYMMDD') )::int)

set filedate = ((to_char(current_date -2,'YYYYMMDD') )::int);

select $filedate;

INSERT INTO PO_HRIS_DB."survey".PO_Survey_Participant
(
Employee_Id ,
Survey ,
Fiscal_Year ,
Source_FileName ,
Created_Datetime ,
Created_By ,
Modified_Datetime ,
Modified_By ,
Batch_ID 

)
select $1,'Anniversary','FY24',METADATA$FILENAME,current_timestamp,current_user,current_timestamp,current_user,20231106 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_Anniversary_$filedate_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
select $1,'Exit',null,METADATA$FILENAME,current_timestamp,current_user,current_timestamp,current_user,20231106 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/outbound/QL_Participant_Exit_$filedate_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
select $1,'New_Hire_90Day',null,METADATA$FILENAME,current_timestamp,current_user,current_timestamp,current_user,20231106 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/outbound/QL_Participant_New_Hire_3_Mth_$filedate_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
select $1,'New_Hire_14Day',null,METADATA$FILENAME,current_timestamp,current_user,current_timestamp,current_user,20231106 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/outbound/QL_Participant_New_Hire_14Day_$filedate_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t;

set sel_statement:= 'INSERT INTO PO_HRIS_DB."survey".PO_Survey_Participant
(
Employee_Id 
) select employee_id from PO_HRIS_DB."survey".PO_Survey_Participant where batch_id ='||Batch_ID;

execute immediate :sel_statement;


CREATE OR REPLACE PROCEDURE sp_survey_participant(Filedate int)
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
batch_id int;


begin


record_date := current_date();
created_datetime := current_timestamp(); 
modified_datetime := current_timestamp(); 
created_by := current_user();
modified_by :=  current_user();
select ((to_char(current_date -1,'YYYYMMDD') )::int) into batch_id;

truncate table PO_HRIS_DB."survey".PO_Survey_Participant;

let sel_statement:= 
'
INSERT INTO PO_HRIS_DB."survey".PO_Survey_Participant
(
Employee_Id ,
Survey ,
Fiscal_Year ,
Source_FileName ,
Created_Datetime ,
Created_By ,
Modified_Datetime ,
Modified_By ,
Batch_ID 

)
select $1,''Anniversary'',''FY24'',METADATA$FILENAME,'''||created_datetime||''','''||created_by||''','''||modified_datetime||''','''||modified_by||''','||batch_id||' from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_Anniversary_'|| Filedate ||'_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
select $1,''Exit'',null,METADATA$FILENAME,'''||created_datetime||''','''||created_by||''','''||modified_datetime||''','''||modified_by||''','||batch_id||' from 
@PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_Exit_'|| Filedate ||'_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
select $1,''New_Hire_90Day'',null,METADATA$FILENAME,'''||created_datetime||''','''||created_by||''','''||modified_datetime||''','''||modified_by||''','||batch_id||' from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_New_Hire_3_Mth_'|| Filedate ||'_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
select $1,''New_Hire_14Day'',null,METADATA$FILENAME,'''||created_datetime||''','''||created_by||''','''||modified_datetime||''','''||modified_by||''','||batch_id||' from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_New_Hire_14Day_'|| Filedate ||'_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t;
'

;

execute immediate :sel_statement;

Return sel_statement;

//Return 

  END;
  $$;

  call sp_survey_participant(20240221);

  create or replace task PO_HRIS_DB."survey".t_survey_participant
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 15 * * * America/Chicago'
//Schedule = '1 Minute'
//when system$stream_has_data('"PO_STAGE_DB"."survey"."S_NEW_HIRE_SURVEY_LOAD"')
as 
Call sp_survey_participant((to_char(current_date,'YYYYMMDD') )::int)
;



alter task PO_HRIS_DB."survey".t_survey_participant resume;

  INSERT INTO PO_HRIS_DB."survey".PO_Survey_Participant ( Employee_Id  ) select employee_id from PO_HRIS_DB."survey".PO_Survey_Participant where batch_id =20240221

truncate table from PO_HRIS_DB."survey".PO_SURVEY_PARTICIPANT;
 INSERT INTO PO_HRIS_DB."survey".PO_Survey_Participant ( Employee_Id , Survey , Fiscal_Year , Source_FileName , Created_Datetime , Created_By , Modified_Datetime , Modified_By , Batch_ID  ) select $1,'Anniversary','FY24',METADATA$FILENAME,'2024-02-22 03:51:56.473','ABANKULA','2024-02-22 03:51:56.486','ABANKULA',20240221 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_Anniversary_20240221_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t union all select $1,'Exit',null,METADATA$FILENAME,'2024-02-22 03:51:56.473','ABANKULA','2024-02-22 03:51:56.486','ABANKULA',20240221 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_Exit_20240221_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t union all select $1,'New_Hire_90Day',null,METADATA$FILENAME,'2024-02-22 03:51:56.473','ABANKULA','2024-02-22 03:51:56.486','ABANKULA',20240221 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/QL_Participant_New_Hire_3_Mth_20240221_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t union all select $1,'New_Hire_14Day',null,METADATA$FILENAME,'2024-02-22 03:51:56.473','ABANKULA','2024-02-22 03:51:56.486','ABANKULA',20240221 from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/outbound/QL_Participant_New_Hire_14Day_20240221_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t; 