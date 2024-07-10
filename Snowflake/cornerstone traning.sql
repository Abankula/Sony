
//drop TABLE "PO_STAGE_DB"."ld".po_corner_stone_traning_stage
CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_corner_stone_training_stage
(
lo_object_id Varchar(40),
object_type Varchar(10),
lo_type Varchar(20),
object_id Varchar(40),
lo_object_type Varchar(10),
lo_hours Varchar(10),
lo_size Varchar(10),
lo_credit Varchar(10),
lo_max_score Varchar(10),
lo_mastery_score Varchar(10),
lo_price Varchar(10),
lo_root_id Varchar(40),
lo_start_dt Varchar(30),
lo_end_dt Varchar(30),
lo_locator Varchar(10),
lo_reg_min Varchar(10),
lo_reg_max Varchar(10),
lo_min_parts Varchar(10),
lo_withdraw_dt Varchar(10),
lo_instructor_id Varchar(40),
lo_location_id Varchar(10),
lo_provider_id Varchar(40),
lo_version Varchar(10),
lo_contact Varchar(20),
lo_contact_user_ref Varchar(20),
lo_no_show Varchar(10),
lo_withdrawal_penalty Varchar(10),
lo_created_by_user_id Varchar(10),
lo_end_registration Varchar(20),
lo_adv_reg_deadline Varchar(20),
lo_eval_01_override Varchar(10),
lo_eval_02_override Varchar(10),
lo_eval_03_override Varchar(10),
lo_active Varchar(10),
total_sco Varchar(10),
lo_create_dt Varchar(30),
related_lo_id Varchar(40),
classification_id Varchar(40),
lo_language_id Varchar(10),
lo_status_type Varchar(10),
lo_currency_id Varchar(10),
lo_modified_by_user_id Varchar(10),
lo_modified_dt Varchar(20),
lo_seats_total Varchar(10),
lo_seats_taken Varchar(10),
lo_seats_available Varchar(10),
lo_total_users_requests Varchar(10),
lo_publication_id Varchar(10),
lo_material_type_id Varchar(10),
lo_interest_tracking_allowed Varchar(10),
lo_multiple_sessions_allowed Varchar(10),
lo_waitlist_allowed Varchar(10),
lo_waitlist_auto_register Varchar(10),
lo_waitlist_auto_manage Varchar(10),
lo_owner_names Varchar(70),
lo_timezone_id Varchar(10),
lo_total_cost Varchar(10),
lo_test_graders_ids Varchar(10),
lo_test_attempts_allowed Varchar(10),
lo_test_max_time_allowed Varchar(10),
lo_test_max_entries Varchar(10),
lo_session_selection_allowed Varchar(10),
lo_admin_session_selection_allowed Varchar(10),
lo_billing_entity Varchar(10),
lo_product_code Varchar(10),
lo_secondary_training_provider_id Varchar(40),
lo_is_part_of_curriculum Varchar(10),
lo_connect_item_type_id Varchar(10),
training_version_effective_dt Varchar(30),
training_version_start_dt Varchar(10),
training_version_end_dt Varchar(10),
lo_secondary_training_provider Varchar(40),
lo_training_ref Varchar(40),
lo_owners_ids Varchar(70),
lo_type_id Varchar(10),
lo_ref Varchar(100),
lo_email_option_id Varchar(10),
lo_root_title Varchar(180),
lo_provider Varchar(60),
lo_provider_address1 Varchar(30),
lo_provider_address2 Varchar(10),
lo_provider_mailstop Varchar(10),
lo_provider_city Varchar(20),
lo_provider_state Varchar(10),
lo_provider_zip Varchar(10),
lo_created_by Varchar(50),
lo_created_by_fullname Varchar(50),
lo_created_by_user_ref Varchar(30),
lo_modified_by Varchar(50),
lo_modified_by_fullname Varchar(50),
lo_modified_by_user_ref Varchar(30),
lo_timezone_code Varchar(10),
lo_provider_active Varchar(10),
lo_currency_code Varchar(10),
lo_currency_symbol Varchar(10),
lo_language Varchar(20),
lo_status Varchar(10),
classification Varchar(2750),
lo_billing_entity_name Varchar(10),
lo_postwork_titles Varchar(50),
lo_prework_titles Varchar(100),
lo_skills Varchar(10),
lo_material_type_active Varchar(10),
lo_publication_published Varchar(10),
lo_publication_created_by Varchar(30),
lo_publication_created_dt Varchar(20),
training_deactivation_dt Varchar(30),
lo_root_ref Varchar(100),
keywords Varchar(200),
lo_title Varchar(180),
lo_instructor Varchar(40),
lo_eval_01 Varchar(10),
lo_eval_02 Varchar(10),
lo_eval_03 Varchar(10),
training_latest_version Varchar(10),
electronic_signature_required Varchar(10),
course_code Varchar(10),
is_ojt_enabled Varchar(10),
lo_material_status Varchar(10),
lo_is_mobile_compatible Varchar(10),
is_latest_training_version Varchar(10),
last_touched_dt_utc Varchar(30),
event_min_enrollment Varchar(10),
event_max_enrollment Varchar(10),
is_available_offline Varchar(10),
is_available_offline_network Varchar(10),
browser_compatibility_mode Varchar(20),
online_course_protocol_id Varchar(10),
is_excluded_from_recommendations Varchar(10),
Source_Filename Varchar
);

CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_corner_stone_training
(
lo_object_id Varchar(40),
object_type Varchar(10),
lo_type Varchar(20),
object_id Varchar(40),
lo_object_type Varchar(10),
lo_hours Varchar(10),
lo_size Varchar(10),
lo_credit Varchar(10),
lo_max_score Varchar(10),
lo_mastery_score Varchar(10),
lo_price Varchar(10),
lo_root_id Varchar(40),
lo_start_dt timestamp_ntz,
lo_end_dt timestamp_ntz,
lo_locator Varchar(10),
lo_reg_min Varchar(10),
lo_reg_max Varchar(10),
lo_min_parts Varchar(10),
lo_withdraw_dt Varchar(10),
lo_instructor_id Varchar(40),
lo_location_id Varchar(10),
lo_provider_id Varchar(40),
lo_version Varchar(10),
lo_contact Varchar(20),
lo_contact_user_ref Varchar(20),
lo_no_show Varchar(10),
lo_withdrawal_penalty Varchar(10),
lo_created_by_user_id Varchar(10),
end_registration_dt timestamp_ntz,
adv_reg_deadline_dt timestamp_ntz,
lo_eval_01_override Varchar(10),
lo_eval_02_override Varchar(10),
lo_eval_03_override Varchar(10),
lo_active boolean,
total_sco Varchar(10),
lo_create_dt timestamp_ntz,
related_lo_id Varchar(40),
classification_id Varchar(40),
lo_language_id Varchar(10),
lo_status_type Varchar(10),
lo_currency_id Varchar(10),
lo_modified_by_user_id Varchar(10),
lo_modified_dt timestamp_ntz,
lo_seats_total number,
lo_seats_taken number,
lo_seats_available number,
lo_total_users_requests number,
lo_publication_id number,
lo_material_type_id Varchar(10),
lo_interest_tracking_allowed boolean,
lo_multiple_sessions_allowed boolean,
lo_waitlist_allowed boolean,
lo_waitlist_auto_register boolean,
lo_waitlist_auto_manage boolean,
lo_owner_names Varchar(70),
lo_timezone_id Varchar(10),
lo_total_cost Varchar(10),
lo_test_graders_ids Varchar(10),
lo_test_attempts_allowed Varchar(10),
lo_test_max_time_allowed Varchar(10),
lo_test_max_entries Varchar(10),
lo_session_selection_allowed Varchar(10),
lo_admin_session_selection_allowed Varchar(10),
lo_billing_entity Varchar(10),
lo_product_code Varchar(10),
lo_secondary_training_provider_id Varchar(40),
lo_is_part_of_curriculum boolean,
lo_connect_item_type_id Varchar(10),
training_version_effective_dt timestamp_ntz,
training_version_start_dt timestamp_ntz,
training_version_end_dt timestamp_ntz,
lo_secondary_training_provider Varchar(40),
lo_training_ref Varchar(40),
lo_owners_ids Varchar(70),
lo_type_id Varchar(10),
lo_ref Varchar(100),
lo_email_option_id Varchar(10),
lo_root_title Varchar(180),
lo_provider Varchar(60),
lo_provider_address1 Varchar(30),
lo_provider_address2 Varchar(10),
lo_provider_mailstop Varchar(10),
lo_provider_city Varchar(20),
lo_provider_state Varchar(10),
lo_provider_zip Varchar(10),
lo_created_by Varchar(50),
lo_created_by_fullname Varchar(50),
lo_created_by_user_ref Varchar(30),
lo_modified_by Varchar(50),
lo_modified_by_fullname Varchar(50),
lo_modified_by_user_ref Varchar(30),
lo_timezone_code Varchar(10),
lo_provider_active Varchar(10),
lo_currency_code Varchar(10),
lo_currency_symbol Varchar(10),
lo_language Varchar(20),
lo_status Varchar(10),
classification Varchar(2750),
lo_billing_entity_name Varchar(10),
lo_postwork_titles Varchar(50),
lo_prework_titles Varchar(100),
lo_skills Varchar(10),
lo_material_type_active Varchar(10),
lo_publication_published Varchar(10),
lo_publication_created_by Varchar(30),
lo_publication_created_dt timestamp_ntz,
training_deactivation_dt Varchar(30),
lo_root_ref Varchar(100),
keywords Varchar(200),
lo_title Varchar(180),
lo_instructor Varchar(40),
lo_eval_01 Varchar(10),
lo_eval_02 Varchar(10),
lo_eval_03 Varchar(10),
training_latest_version Varchar(10),
electronic_signature_required Varchar(10),
course_code Varchar(10),
is_ojt_enabled Varchar(10),
lo_material_status Varchar(10),
lo_is_mobile_compatible Varchar(10),
is_latest_training_version Varchar(10),
last_touched_dt_utc timestamp_ntz,
event_min_enrollment Varchar(10),
event_max_enrollment Varchar(10),
is_available_offline Varchar(10),
is_available_offline_network Varchar(10),
browser_compatibility_mode Varchar(20),
online_course_protocol_id Varchar(10),
is_excluded_from_recommendations Varchar(10),
Source_FileName Varchar(200),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
);


truncate table "PO_STAGE_DB"."ld".po_corner_stone_training_stage;

  select *
  from table(information_schema.task_history()) 
  order by scheduled_time;

truncate table "PO_STAGE_DB"."ld".po_corner_stone_training_stage;

create or replace pipe PO_STAGE_DB."survey".p_corner_stone_training_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."ld".po_corner_stone_training_stage
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
$71,
$72,
$73,
$74,
$75,
$76,
$77,
$78,
$79,
$80,
$81,
$82,
$83,
$84,
$85,
$86,
$87,
$88,
$89,
$90,
$91,
$92,
$93,
$94,
$95,
$96,
$97,
$98,
$99,
$100,
$101,
$102,
$103,
$104,
$105,
$106,
$107,
$108,
$109,
$110,
$111,
$112,
$113,
$114,
$115,
$116,
$117,
$118,
$119,
$120,
$121,
$122,
$123,
$124,
$125,
$126,
$127,
$128,
$129,
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
//pattern = '.*CORNERSTONE_RPT_Training.*.*csv'
pattern = '.*CORNERSTONE_RPT_Training_page_45.*.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

/*stream for exit*/
create or replace stream "PO_STAGE_DB"."ld".s_corner_stone_tranining_load
COPY GRANTS on table "PO_STAGE_DB"."ld".po_corner_stone_training_stage
APPEND_ONLY = TRUE
;

alter task "PO_HRIS_DB"."ld".t_corner_stone_tranining_load resume;

/*Task for Exit*/
create or replace task "PO_HRIS_DB"."ld".t_corner_stone_tranining_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 9 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('PO_STAGE_DB."ld".s_corner_stone_tranining_load')
as 
Call "PO_HRIS_DB"."ld".sp_corner_stone_training_load((to_char(current_date -1,'YYYYMMDD') )::int)
;



//select * from "PO_HRIS_DB"."ld".po_corner_stone_training limit 1;


 
CREATE OR REPLACE PROCEDURE "PO_HRIS_DB"."ld".sp_corner_stone_training_load(Batch_ID int)
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

truncate table "PO_HRIS_DB"."ld".po_corner_stone_training;


create or replace temp table tt_cs_training_rk  as 
select *,row_number() over(partition by object_id order by lo_modified_dt desc ) rk 
from "PO_STAGE_DB"."ld".po_corner_stone_training_stage
;

insert into "PO_HRIS_DB"."ld".po_corner_stone_training
(
lo_object_id,
object_type,
lo_type,
object_id,
lo_object_type,
lo_hours,
lo_size,
lo_credit,
lo_max_score,
lo_mastery_score,
lo_price,
lo_root_id,
lo_start_dt,
lo_end_dt,
lo_locator,
lo_reg_min,
lo_reg_max,
lo_min_parts,
lo_withdraw_dt,
lo_instructor_id,
lo_location_id,
lo_provider_id,
lo_version,
lo_contact,
lo_contact_user_ref,
lo_no_show,
lo_withdrawal_penalty,
lo_created_by_user_id,
end_registration_dt,
adv_reg_deadline_dt,
lo_eval_01_override,
lo_eval_02_override,
lo_eval_03_override,
lo_active,
total_sco,
lo_create_dt,
related_lo_id,
classification_id,
lo_language_id,
lo_status_type,
lo_currency_id,
lo_modified_by_user_id,
lo_modified_dt,
lo_seats_total,
lo_seats_taken,
lo_seats_available,
lo_total_users_requests,
lo_publication_id,
lo_material_type_id,
lo_interest_tracking_allowed,
lo_multiple_sessions_allowed,
lo_waitlist_allowed,
lo_waitlist_auto_register,
lo_waitlist_auto_manage,
lo_owner_names,
lo_timezone_id,
lo_total_cost,
lo_test_graders_ids,
lo_test_attempts_allowed,
lo_test_max_time_allowed,
lo_test_max_entries,
lo_session_selection_allowed,
lo_admin_session_selection_allowed,
lo_billing_entity,
lo_product_code,
lo_secondary_training_provider_id,
lo_is_part_of_curriculum,
lo_connect_item_type_id,
training_version_effective_dt,
training_version_start_dt,
training_version_end_dt,
lo_secondary_training_provider,
lo_training_ref,
lo_owners_ids,
lo_type_id,
lo_ref,
lo_email_option_id,
lo_root_title,
lo_provider,
lo_provider_address1,
lo_provider_address2,
lo_provider_mailstop,
lo_provider_city,
lo_provider_state,
lo_provider_zip,
lo_created_by,
lo_created_by_fullname,
lo_created_by_user_ref,
lo_modified_by,
lo_modified_by_fullname,
lo_modified_by_user_ref,
lo_timezone_code,
lo_provider_active,
lo_currency_code,
lo_currency_symbol,
lo_language,
lo_status,
classification,
lo_billing_entity_name,
lo_postwork_titles,
lo_prework_titles,
lo_skills,
lo_material_type_active,
lo_publication_published,
lo_publication_created_by,
lo_publication_created_dt,
training_deactivation_dt,
lo_root_ref,
keywords,
lo_title,
lo_instructor,
lo_eval_01,
lo_eval_02,
lo_eval_03,
training_latest_version,
electronic_signature_required,
course_code,
is_ojt_enabled,
lo_material_status,
lo_is_mobile_compatible,
is_latest_training_version,
last_touched_dt_utc,
event_min_enrollment,
event_max_enrollment,
is_available_offline,
is_available_offline_network,
browser_compatibility_mode,
online_course_protocol_id,
is_excluded_from_recommendations,
Source_FileName ,
Created_Date ,
Created_By ,
Modified_Date ,
Modifeid_By ,
Batch_ID 
)
select 
lo_object_id ,
object_type ,
lo_type ,
object_id ,
lo_object_type ,
lo_hours ,
lo_size ,
lo_credit ,
lo_max_score ,
lo_mastery_score ,
lo_price ,
lo_root_id ,
lo_start_dt ,
lo_end_dt ,
lo_locator ,
lo_reg_min ,
lo_reg_max ,
lo_min_parts ,
lo_withdraw_dt ,
lo_instructor_id ,
lo_location_id ,
lo_provider_id ,
lo_version ,
lo_contact ,
lo_contact_user_ref ,
lo_no_show ,
lo_withdrawal_penalty ,
lo_created_by_user_id ,
lo_end_registration ,
lo_adv_reg_deadline ,
lo_eval_01_override ,
lo_eval_02_override ,
lo_eval_03_override ,
lo_active ,
total_sco ,
lo_create_dt ,
related_lo_id ,
classification_id ,
lo_language_id ,
lo_status_type ,
lo_currency_id ,
lo_modified_by_user_id ,
lo_modified_dt ,
lo_seats_total ,
lo_seats_taken ,
lo_seats_available ,
lo_total_users_requests ,
lo_publication_id ,
lo_material_type_id ,
lo_interest_tracking_allowed ,
lo_multiple_sessions_allowed ,
lo_waitlist_allowed ,
lo_waitlist_auto_register ,
lo_waitlist_auto_manage ,
lo_owner_names ,
lo_timezone_id ,
lo_total_cost ,
lo_test_graders_ids ,
lo_test_attempts_allowed ,
lo_test_max_time_allowed ,
lo_test_max_entries ,
lo_session_selection_allowed ,
lo_admin_session_selection_allowed ,
lo_billing_entity ,
lo_product_code ,
lo_secondary_training_provider_id ,
lo_is_part_of_curriculum ,
lo_connect_item_type_id ,
training_version_effective_dt ,
training_version_start_dt ,
training_version_end_dt ,
lo_secondary_training_provider ,
lo_training_ref ,
lo_owners_ids ,
lo_type_id ,
lo_ref ,
lo_email_option_id ,
lo_root_title ,
lo_provider ,
lo_provider_address1 ,
lo_provider_address2 ,
lo_provider_mailstop ,
lo_provider_city ,
lo_provider_state ,
lo_provider_zip ,
lo_created_by ,
lo_created_by_fullname ,
lo_created_by_user_ref ,
lo_modified_by ,
lo_modified_by_fullname ,
lo_modified_by_user_ref ,
lo_timezone_code ,
lo_provider_active ,
lo_currency_code ,
lo_currency_symbol ,
lo_language ,
lo_status ,
classification ,
lo_billing_entity_name ,
lo_postwork_titles ,
lo_prework_titles ,
lo_skills ,
lo_material_type_active ,
lo_publication_published ,
lo_publication_created_by ,
lo_publication_created_dt ,
training_deactivation_dt ,
lo_root_ref ,
keywords ,
lo_title ,
lo_instructor ,
lo_eval_01 ,
lo_eval_02 ,
lo_eval_03 ,
training_latest_version ,
electronic_signature_required ,
course_code ,
is_ojt_enabled ,
lo_material_status ,
lo_is_mobile_compatible ,
is_latest_training_version ,
last_touched_dt_utc ,
event_min_enrollment ,
event_max_enrollment ,
is_available_offline ,
is_available_offline_network ,
browser_compatibility_mode ,
online_course_protocol_id ,
is_excluded_from_recommendations ,
source_filename,
:created_datetime ,
:created_by ,
:modified_datetime ,
:modified_by ,
:Batch_ID 
from tt_cs_training_rk where rk =1
//"PO_STAGE_DB"."ld".po_corner_stone_training_stage
;

Truncate table "PO_STAGE_DB"."ld".po_corner_stone_training_stage;

Return 'Done';

  END;
  $$;























select * from "PO_HRIS_DB"."ld".po_corner_stone_training;--44967;

select count(*),lo_root_title from "PO_HRIS_DB"."ld".po_corner_stone_training group by 2 having count(*) > 2;




















lo_active - N 
lo_create_dt-
;
Select *
//max(lo_create_dt::datetime)
//count(*),source_filename
//count(*),lo_root_id,lo_start_dt
From
"PO_STAGE_DB"."ld".po_corner_stone_training_stage where
(lo_root_title) like '%Cybersecurity Awareness | New Hire Virtual Escape Room%'

'a8256942-2d6b-485e-9b27-d85b76a501f5' 
//limit 10;
//where 
//lo_root_id <> '00000000-0000-0000-0000-000000000000'
//lo_object_id <> lo_root_id--root id is different
//trim(upper(LO_TITLE))<>trim(upper(LO_Root_Title))--both are same
//LO_Status_type<>LO_Status--both are same
group by 2 having count(*) > 1
;





SPOTLIGHT: Breakfast Briefings 2022	SPOTLIGHT EBRG	SPOTLIGHT: Breakfast Briefings 2022
SPOTLIGHT: Breakfast Briefings 2022		SPOTLIGHT: Breakfast Briefings 2022
ed78fb6c-3d3e-4f18-8aee-1bba5198d7cd
fcdb414d-114c-4d39-9b82-30aaeaa98901
96507298-cb0d-4e47-ae18-c5f67b0da017