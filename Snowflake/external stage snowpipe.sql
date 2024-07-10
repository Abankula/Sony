CREATE OR REPLACE STORAGE INTEGRATION s3_int_apex
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::830827275333:role/snowflake_apex_role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://spe-apex-prod/');
 -- [ STORAGE_BLOCKED_LOCATIONS = ('s3://<bucket>/<path>/', 's3://<bucket>/<path>/') ]

desc integration s3_int_apex;

CREATE OR REPLACE STAGE my_s3_stage
  STORAGE_INTEGRATION = s3_int_apex
  URL = 's3://spe-apex-prod/outbound/'
  FILE_FORMAT = PO_STAGE_DB."Worker".csv_load_format

  CREATE OR REPLACE STAGE my_s3_stage_inbound
  STORAGE_INTEGRATION = s3_int_apex
  URL = 's3://spe-apex-prod/inbound/'
  FILE_FORMAT = PO_STAGE_DB."Worker".csv_load_format

  
  desc stage PO_STAGE_DB.PUBLIC.MY_S3_STAGE_INBOUND

  list @PO_STAGE_DB.PUBLIC.my_s3_stage_test;

  list @PO_STAGE_DB."Worker".MY_S3_STAGE_TEST

show pipes;

truncate table PO_STAGE_DB."survey".anniv_test;

create or replace pipe QL_Part_Anniversary 
auto_ingest = true 
as
copy into PO_STAGE_DB."survey".anniv_test
from (select $1,METADATA$FILENAME from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*LL_3333.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

drop pipe  QL_Part_Anniversary 
//https://www.youtube.com/watch?v=7X52Jv2uflo&ab_channel=KnowledgeAmplifier

select distinct FILENAME from PO_STAGE_DB."survey".anniv_test

select current_timestamp
select system$get_aws_sns_iam_policy('')

SELECT SYSTEM$PIPE_STATUS('PO_STAGE_DB."survey".QL_PART_ANNIVERSARY');

{"executionState":"RUNNING","pendingFileCount":0,"notificationChannelName":"arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w","numOutstandingMessagesOnChannel":4,"lastReceivedMessageTimestamp":"2024-01-12T05:30:53.306Z","lastForwardedMessageTimestamp":"2024-01-12T05:30:53.379Z","lastPulledFromChannelTimestamp":"2024-01-12T05:30:58.195Z","lastForwardedFilePath":"spe-apex-prod/outbound/CORNERSTONE_RPT_Transcript_page_186_20240105.csv"}

{"executionState":"RUNNING","pendingFileCount":0,"notificationChannelName":"arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w","numOutstandingMessagesOnChannel":2,"lastReceivedMessageTimestamp":"2024-01-12T05:34:13.24Z","lastForwardedMessageTimestamp":"2024-01-12T05:34:13.319Z","lastPulledFromChannelTimestamp":"2024-01-12T05:34:18.21Z","lastForwardedFilePath":"spe-apex-prod/outbound/WD_Business_Process_Trans_20240112_hashed.csv"}

{"executionState":"RUNNING","pendingFileCount":0,"notificationChannelName":"arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w","numOutstandingMessagesOnChannel":1,"lastReceivedMessageTimestamp":"2024-01-12T05:41:38.202Z","lastForwardedMessageTimestamp":"2024-01-12T05:41:38.281Z","lastPulledFromChannelTimestamp":"2024-01-12T05:42:38.199Z","lastForwardedFilePath":"spe-apex-prod/outbound/LL_20240112_hashed.csv"}

{"executionState":"RUNNING","pendingFileCount":0,"notificationChannelName":"arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w","numOutstandingMessagesOnChannel":1,"lastReceivedMessageTimestamp":"2024-01-12T05:44:48.212Z","lastForwardedMessageTimestamp":"2024-01-12T05:44:48.845Z","lastPulledFromChannelTimestamp":"2024-01-12T05:44:53.217Z","lastForwardedFilePath":"spe-apex-prod/outbound/LL_20240112_hashed.csv"}

PO_STAGE_DB."survey".QL_PART_ANNIVERSARY

SNS arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w
arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w

desc pipe  QL_Part_Anniversary

select * from anniv_test; 

 2019-11_1654478715.csv 
 '.*2011-09.*csv.*.gz'

 select * from table(validate_pipe_load(pipe_name =>'PO_STAGE_DB."survey".QL_PART_ANNIVERSARY')),start_time =>dateadd(hour, 148, current_timestamp())))


 {"executionState":"RUNNING","pendingFileCount":0,"lastIngestedTimestamp":"2024-01-12T05:44:48.54Z","lastIngestedFilePath":"LL_20240112_hashed.csv","notificationChannelName":"arn:aws:sqs:us-west-2:774708397847:sf-snowpipe-AIDA3IYBYA4L4SILECDOM-aNkeKZnVEdL-KrxSmU0A-w","numOutstandingMessagesOnChannel":1,"lastReceivedMessageTimestamp":"2024-01-14T15:02:13.238Z","lastForwardedMessageTimestamp":"2024-01-14T15:02:13.274Z","lastPulledFromChannelTimestamp":"2024-01-14T19:49:53.171Z","lastForwardedFilePath":"spe-apex-prod/outbound/HMM_20240114000000_hashed.csv"}

 
create or replace table anniv_test
(
ID Varchar,
FIlename Varchar
)

truncate table anniv_test;

select * from anniv_test;


drop stage PO_STAGE_DB."Worker".MY_EXT_S3

s3://spe-apex-prod/outbound/QL_Participant_Anniversary_*.csv