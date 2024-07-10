Use warehouse PO_WH;
Use Role SYSADMIN;
Use Database PO_STG_DB;

desc file format json_load_format;

CREATE OR REPLACE FILE FORMAT json_load_format
  TYPE = 'JSON'
     COMPRESSION = none
        STRIP_OUTER_ARRAY = true
  file_extension = '.json'
   ALLOW_DUPLICATE = TRUE 
   --TRIM_SPACE = TRUE
  ;
  

Create or replace Stage worker_Load_instg
FILE_FORMAT = json_load_format;

put file://C:\Users\abankula\Documents\Job_Application\*.json @"Worker".worker_load_instg AUTO_COMPRESS=false SOURCE_COMPRESSION=NONE OVERWRITE=TRUE;

Copy into PO_WD_APPLICATION_JSON 
from (select parse_json($1['Report_Entry']) from @worker_load_instg/Job_Applications_Split.json)

INSERT INTO  PO_WD_APPLICATION_JSON 
 (select t.value 
from @worker_load_instg/Job_Applications_Split.json (file_format => 'json_load_format') as S
, table(flatten(S.$1,'Report_Entry')) t);


select *
from (select parse_json($1['Report_Entry']) as Json from @worker_load_instg/Job_Applications_Split.json) t
(file_format => json_load_format)

(file_format => json_load_format);

select parse_json($1:Report_Entry.Application_Date)
 from @worker_load_instg/Job_Applications_Split.json 

PO_WD_APPLICATION_JSON

delete from PO_WD_APPLICATION_JSON

select App_Json.Application_Date from PO_WD_APPLICATION_JSON;

select App_Json:Application_Date from PO_WD_APPLICATION_JSON;

select t.$1.Application_Date from @worker_load_instg t
show stages in po_stage_db.Worker

desc stage worker_Load_instg

worker_load_instg/Job_Applications_Split.json

worker_load_instg/Job_Applications - Split.json
list @Worker_LOAD_INSTG

remove @worker_Load_instg PATTERN='.*.csv.gz';

desc stage @worker_load_instg (file_format => 'json_load_format') t; 


 copy into "Transactions".PO_WD_Transaction_History_STG

 from @Transactions_Load_Stage


 select intiated_datetime::datetime,* from  "Transactions".PO_WD_Transaction_History_STG;

 create or replace stage my_ext_s3
 url = 's3://awsglue-datasets/examples/us-legislators/all/';

 list @my_ext_s3 

 drop stage my_ext_s3

 desc schema po_stage_db.Worker

 select * from po_wd_application_stg
--Application object with JSON data

create or replace transient table PO_WD_APPLICATION_JSON (
App_Json variant
);

 insert into PO_WD_APPLICATION_JSON(App_Json)