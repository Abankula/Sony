Use  PO_STAGE_DB."ld";

CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_corner_stone_transcript_stage
(
reg_num Varchar(10),
user_lo_status_id Varchar(20),
user_lo_score Varchar(10),
user_lo_create_dt Varchar(20),
user_lo_reg_dt Varchar(30),
user_lo_start_dt Varchar(30),
user_lo_comp_dt Varchar(30),
user_lo_last_access_dt Varchar(20),
user_lo_minutes_participated Varchar(10),
user_lo_num_attempts Varchar(10),
user_lo_assignor_id Varchar(10),
user_lo_assignor_ref Varchar(30),
user_lo_assignor Varchar(30),
user_lo_comment Varchar(10),
user_lo_min_due_date Varchar(20),
is_removed Varchar(10),
user_lo_removed_reason_id Varchar(10),
user_lo_removed_comments Varchar(230),
user_lo_removed_dt Varchar(30),
completed_sco Varchar(10),
archived Varchar(10),
user_lo_assigned_comments Varchar(250),
user_lo_assigned_dt Varchar(30),
training_purpose Varchar(10),
training_purpose_category Varchar(10),
user_lo_last_action_dt Varchar(30),
user_lo_pct_complete Varchar(10),
exemptor_id Varchar(10),
exempt_comment Varchar(10),
approver_exempt_comment Varchar(100),
exempt_dt Varchar(30),
exempt_reason_id Varchar(10),
exempt_approver_reason_id Varchar(10),
exempt_reason Varchar(10),
exempt_approver_reason Varchar(10),
is_assigned Varchar(10),
is_suggested Varchar(10),
is_required Varchar(10),
is_latest_reg_num Varchar(10),
is_archive Varchar(10),
user_lo_pass Varchar(10),
user_lo_cancellation_reason_id Varchar(10),
user_lo_cancellation_reason Varchar(250),
user_lo_withdrawal_reason_id Varchar(10),
user_lo_withdrawal_reason Varchar(250),
user_lo_from_training_plan Varchar(10),
user_lo_available_dt Varchar(20),
user_lo_training_link_expiration_date Varchar(10),
user_lo_timezone_code Varchar(10),
user_lo_withdrawal_date Varchar(30),
transcript_badge_id Varchar(10),
transcript_badge_points Varchar(10),
transcript_training_points Varchar(10),
transc_user_id Varchar(10),
transc_object_id Varchar(40),
user_lo_status_group_id Varchar(10),
is_latest_version_on_transcript Varchar(10),
user_lo_last_modified_dt Varchar(20),
last_touched_dt_utc Varchar(30),
is_express_class Varchar(10),
user_lo_equivalent_object_id Varchar(40),
user_lo_equivalency_type Varchar(10),
user_lo_delivery_method_id Varchar(10),
is_standalone Varchar(10),
user_lo_remover_id Varchar(10),
Source_Filename Varchar
)
;

CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_corner_stone_transcript
(
reg_num Number,
user_lo_status_id Varchar(20),
user_lo_score Number,
user_lo_create_dt timestamp_ntz,
user_lo_reg_dt timestamp_ntz,
user_lo_start_dt timestamp_ntz,
user_lo_comp_dt timestamp_ntz,
user_lo_last_access_dt timestamp_ntz,
user_lo_minutes_participated Number,
user_lo_num_attempts Varchar(10),
user_lo_assignor_id Number,
user_lo_assignor_ref Varchar(30),
user_lo_assignor Varchar(30),
user_lo_comment Varchar(10),
user_lo_min_due_date Varchar(20),
is_removed Boolean,
user_lo_removed_reason_id Varchar(10),
user_lo_removed_comments Varchar(230),
user_lo_removed_dt Varchar(30),
completed_sco Varchar(10),
archived Boolean,
user_lo_assigned_comments Varchar(250),
user_lo_assigned_dt timestamp_ntz,
training_purpose Varchar(10),
training_purpose_category Varchar(10),
user_lo_last_action_dt timestamp_ntz,
user_lo_pct_complete Varchar(10),
exemptor_id Varchar(10),
exempt_comment Varchar(10),
approver_exempt_comment Varchar(100),
exempt_dt Varchar(30),
exempt_reason_id Varchar(10),
exempt_approver_reason_id Varchar(10),
exempt_reason Varchar(10),
exempt_approver_reason Varchar(10),
is_assigned Boolean,
is_suggested Boolean,
is_required Boolean,
is_latest_reg_num Varchar(10),
is_archive Varchar(10),
user_lo_pass Varchar(10),
user_lo_cancellation_reason_id Varchar(10),
user_lo_cancellation_reason Varchar(250),
user_lo_withdrawal_reason_id Varchar(10),
user_lo_withdrawal_reason Varchar(250),
user_lo_from_training_plan Varchar(10),
user_lo_available_dt Varchar(20),
user_lo_training_link_expiration_date Varchar(10),
user_lo_timezone_code Varchar(10),
user_lo_withdrawal_date Varchar(30),
transcript_badge_id Varchar(10),
transcript_badge_points Varchar(10),
transcript_training_points Varchar(10),
transc_user_id Varchar(10),
transc_object_id Varchar(40),
user_lo_status_group_id Varchar(10),
is_latest_version_on_transcript Varchar(10),
user_lo_last_modified_dt timestamp_ntz,
last_touched_dt_utc timestamp_ntz,
is_express_class boolean,
user_lo_equivalent_object_id Varchar(40),
user_lo_equivalency_type Varchar(10),
user_lo_delivery_method_id Number,
is_standalone boolean,
user_lo_remover_id Varchar(10),
Source_Filename Varchar,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;


Insert into "PO_HRIS_DB"."ld".po_corner_stone_transcript
(
reg_num,
user_lo_status_id,
user_lo_score,
user_lo_create_dt,
user_lo_reg_dt,
user_lo_start_dt,
user_lo_comp_dt,
user_lo_last_access_dt,
user_lo_minutes_participated,
user_lo_num_attempts,
user_lo_assignor_id,
user_lo_assignor_ref,
user_lo_assignor,
user_lo_comment,
user_lo_min_due_date,
is_removed,
user_lo_removed_reason_id,
user_lo_removed_comments,
user_lo_removed_dt,
completed_sco,
archived,
user_lo_assigned_comments,
user_lo_assigned_dt,
training_purpose,
training_purpose_category,
user_lo_last_action_dt,
user_lo_pct_complete,
exemptor_id,
exempt_comment,
approver_exempt_comment,
exempt_dt,
exempt_reason_id,
exempt_approver_reason_id,
exempt_reason,
exempt_approver_reason,
is_assigned,
is_suggested,
is_required,
is_latest_reg_num,
is_archive,
user_lo_pass,
user_lo_cancellation_reason_id,
user_lo_cancellation_reason,
user_lo_withdrawal_reason_id,
user_lo_withdrawal_reason,
user_lo_from_training_plan,
user_lo_available_dt,
user_lo_training_link_expiration_date,
user_lo_timezone_code,
user_lo_withdrawal_date,
transcript_badge_id,
transcript_badge_points,
transcript_training_points,
transc_user_id,
transc_object_id,
user_lo_status_group_id,
is_latest_version_on_transcript,
user_lo_last_modified_dt,
last_touched_dt_utc,
is_express_class,
user_lo_equivalent_object_id,
user_lo_equivalency_type,
user_lo_delivery_method_id,
is_standalone,
user_lo_remover_id,
Created_Date,
Created_By,
Modified_Date,
Modifeid_By,
Batch_ID 

)
select
reg_num,
user_lo_status_id,
user_lo_score,
user_lo_create_dt,
user_lo_reg_dt,
user_lo_start_dt,
user_lo_comp_dt,
user_lo_last_access_dt,
user_lo_minutes_participated,
user_lo_num_attempts,
user_lo_assignor_id,
user_lo_assignor_ref,
user_lo_assignor,
user_lo_comment,
user_lo_min_due_date,
is_removed,
user_lo_removed_reason_id,
user_lo_removed_comments,
user_lo_removed_dt,
completed_sco,
archived,
user_lo_assigned_comments,
user_lo_assigned_dt,
training_purpose,
training_purpose_category,
user_lo_last_action_dt,
user_lo_pct_complete,
exemptor_id,
exempt_comment,
approver_exempt_comment,
exempt_dt,
exempt_reason_id,
exempt_approver_reason_id,
exempt_reason,
exempt_approver_reason,
is_assigned,
is_suggested,
is_required,
is_latest_reg_num,
is_archive,
user_lo_pass,
user_lo_cancellation_reason_id,
user_lo_cancellation_reason,
user_lo_withdrawal_reason_id,
user_lo_withdrawal_reason,
user_lo_from_training_plan,
user_lo_available_dt,
user_lo_training_link_expiration_date,
user_lo_timezone_code,
user_lo_withdrawal_date,
transcript_badge_id,
transcript_badge_points,
transcript_training_points,
transc_user_id,
transc_object_id,
user_lo_status_group_id,
is_latest_version_on_transcript,
user_lo_last_modified_dt,
last_touched_dt_utc,
is_express_class,
user_lo_equivalent_object_id,
user_lo_equivalency_type,
user_lo_delivery_method_id,
is_standalone,
user_lo_remover_id,
current_timestamp,
current_user,
current_timestamp,
current_user,
20240124
from "PO_STAGE_DB"."ld".po_corner_stone_transcript_stage
;


select

max(length(reg_num)) ,
max(length(user_lo_status_id)) ,
max(length(user_lo_score)) ,
max(length(user_lo_create_dt)) ,
max(length(user_lo_reg_dt)) ,
max(length(user_lo_start_dt)) ,
max(length(user_lo_comp_dt)) ,
max(length(user_lo_last_access_dt)) ,
max(length(user_lo_minutes_participated)) ,
max(length(user_lo_num_attempts)) ,
max(length(user_lo_assignor_id)) ,
max(length(user_lo_assignor_ref)) ,
max(length(user_lo_assignor)) ,
max(length(user_lo_comment)) ,
max(length(user_lo_min_due_date)) ,
max(length(is_removed)) ,
max(length(user_lo_removed_reason_id)) ,
max(length(user_lo_removed_comments)) ,
max(length(user_lo_removed_dt)) ,
max(length(completed_sco)) ,
max(length(archived)) ,
max(length(user_lo_assigned_comments)) ,
max(length(user_lo_assigned_dt)) ,
max(length(training_purpose)) ,
max(length(training_purpose_category)) ,
max(length(user_lo_last_action_dt)) ,
max(length(user_lo_pct_complete)) ,
max(length(exemptor_id)) ,
max(length(exempt_comment)) ,
max(length(approver_exempt_comment)) ,
max(length(exempt_dt)) ,
max(length(exempt_reason_id)) ,
max(length(exempt_approver_reason_id)) ,
max(length(exempt_reason)) ,
max(length(exempt_approver_reason)) ,
max(length(is_assigned)) ,
max(length(is_suggested)) ,
max(length(is_required)) ,
max(length(is_latest_reg_num)) ,
max(length(is_archive)) ,
max(length(user_lo_pass)) ,
max(length(user_lo_cancellation_reason_id)) ,
max(length(user_lo_cancellation_reason)) ,
max(length(user_lo_withdrawal_reason_id)) ,
max(length(user_lo_withdrawal_reason)) ,
max(length(user_lo_from_training_plan)) ,
max(length(user_lo_available_dt)) ,
max(length(user_lo_training_link_expiration_date)) ,
max(length(user_lo_timezone_code)) ,
max(length(user_lo_withdrawal_date)) ,
max(length(transcript_badge_id)) ,
max(length(transcript_badge_points)) ,
max(length(transcript_training_points)) ,
max(length(transc_user_id)) ,
max(length(transc_object_id)) ,
max(length(user_lo_status_group_id)) ,
max(length(is_latest_version_on_transcript)) ,
max(length(user_lo_last_modified_dt)) ,
max(length(last_touched_dt_utc)) ,
max(length(is_express_class)) ,
max(length(user_lo_equivalent_object_id)) ,
max(length(user_lo_equivalency_type)) ,
max(length(user_lo_delivery_method_id)) ,
max(length(is_standalone)) ,
max(length(user_lo_remover_id)) select * from "PO_STAGE_DB"."ld".po_corner_stone_transcript_stage limit 2000;







;
CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_corner_stone_transcript_status
(
Status_ID Varchar(30),
Status Varchar(100)
)
;
insert into "PO_HRIS_DB"."ld".po_corner_stone_transcript_status
(
Status_ID ,
Status
)
Select 
Status_ID ,
Status from
"PO_STAGE_DB"."ld".po_corner_stone_transcript_status_stage;

select * from "PO_STAGE_DB"."ld".po_corner_stone_transcript_stage limit 1;

copy into "PO_STAGE_DB"."ld".po_corner_stone_transcript_status_stage
from (select 
$1,
$2
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE) 
pattern = '.*CORNERSTONE_RPT_Transcript_Status*.*_20231220.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

copy into "PO_STAGE_DB"."ld".po_corner_stone_transcript_stage
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE) 
pattern = '.*CORNERSTONE_RPT_Transcript_page_228.*.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

1)

// What is User_lo_assignor fields vs transc_user fields;

;
select 

tts.transc_user_id,
tts.transc_object_id,
tgs.lo_root_title,
tgs.lo_title,
tss.status,
us.user_email,
us.user_name_first,
us.user_name_last,
tgs.lo_root_id,
tts.user_lo_status_id,
tts.user_lo_create_dt,
tts.user_lo_reg_dt,
tts.user_lo_start_dt,
tts.user_lo_comp_dt,
tts.user_lo_assignor,
tts.user_lo_assignor_id,
tts.user_lo_assigned_dt,
tts.user_lo_last_action_dt,
tts.user_lo_status_group_id,
tts.user_lo_last_modified_dt,
tts._last_touched_dt_utc,
tgs.lo_object_type,
tgs.lo_hours,
tgs.lo_size,
tgs.lo_status_type,
us.user_last_login,
us.user_create_dt,
us.user_modify_date
from 
"PO_STAGE_DB"."ld".po_corner_stone_transcript_stage tts 
Inner join "PO_STAGE_DB"."ld".po_corner_stone_training_stage tgs on tts.transc_object_id = tgs.object_id
Inner join "PO_STAGE_DB"."ld".po_corner_stone_transcript_status_stage tss on tss.status_id = tts.user_lo_status_id
Inner join "PO_STAGE_DB"."ld".po_corner_stone_user_stage us on us.user_id = tts.transc_user_id and us.source_filename like '%page_33%'
where  tts.source_filename like '%page_228%' 
and tts.is_latest_version_on_transcript = 'True' 
and user_lo_removed_reason_id is not null 
and transc_user_id = '17';
limit 10;



















select *
//count(distinct transc_user_id)--user IDs matched
//count(distinct user_lo_status_id)--status IDs matched
//count(distinct transc_object_id)--5512--trans IDs matched
from 
"PO_STAGE_DB"."ld".po_corner_stone_transcript_stage tts 
Inner join "PO_STAGE_DB"."ld".po_corner_stone_training_stage tgs on tts.transc_object_id = tgs.object_id
Inner join "PO_STAGE_DB"."ld".po_corner_stone_transcript_status_stage tss on tss.status_id = tts.user_lo_status_id
Inner join "PO_STAGE_DB"."ld".po_corner_stone_user_stage us on us.user_id = tts.transc_user_id and us.source_filename like '%page_33%'
where  tts.source_filename like '%page_228%' 
and is_latest_version_on_transcript = 'True' limit 10;--195936



select 
//distinct tts.transc_object_id,tss.status,tgs.object_id,lo_root_title
//IS_REMOVED::boolean,IS_REMOVED
//user_lo_assigned_dt::datetime,user_lo_assigned_dt
//user_lo_create_dt::datetime,user_lo_create_dt
count(distinct transc_object_id)
from 
"PO_STAGE_DB"."ld".po_corner_stone_transcript_stage tts 
//left join "PO_STAGE_DB"."ld".po_corner_stone_training_stage tgs on tts.transc_object_id = tgs.lo_root_id
//Inner join "PO_STAGE_DB"."ld".po_corner_stone_transcript_status_stage tss on tss.status_id = tts.user_lo_status_id
//Inner join "PO_STAGE_DB"."ld".po_corner_stone_user_stage us on us.user_id = tts.transc_user_id and us.source_filename like '%page_33%'
where 
//upper(user_lo_assignor) like '%MGOR%'
//transc_user_id = '17' 
//and transc_object_id ='b1a29f62-0240-425e-8b07-db3ff514cb3b'
 tts.source_filename like '%page_228%' 
//and user_lo_comp_dt::date = '2021-10-15';
//and tgs.object_id is not null order by tts.transc_object_id
//and is_latest_version_on_transcript = 'True'
//f31e0ee4-4fc0-4e3e-b233-c21203eed6fb
group by 2,3 having count(*)> 10
limit 10;





select *
from 
"PO_STAGE_DB"."ld".po_corner_stone_transcript_stage tts where  transc_object_id = '178fac39-719d-4712-bdb3-dd7a7b2529fe' and transc_user_id = '202'
and tts.source_filename like '%page_228%' 
and is_latest_version_on_transcript = 'True';





select *
from 
"PO_STAGE_DB"."ld".po_corner_stone_training_stage tts 
where object_id = lo_root_id

 select * from PO_HRIS_DB."survey".PO_SURVEY_PARTICIPANT
 
 PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY
