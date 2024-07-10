Use  PO_STAGE_DB."ld";

CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_corner_stone_user_stage
(
user_id Varchar(10),
user_name_first Varchar(128),
user_name_last Varchar(128),
user_ref Varchar(40),
user_login Varchar(50),
user_email Varchar(128),
user_absent Varchar(10),
user_allow_reconcile Varchar(10),
user_name_prefix Varchar(10),
user_name_suffix Varchar(10),
user_name_middle Varchar(30),
user_status_id Varchar(10),
user_mgr_id Varchar(10),
user_mgr_name_first Varchar(128),
user_mgr_name_last Varchar(128),
user_mgr_ref Varchar(128),
user_mgr_email Varchar(128),
user_mgr_mailstop Varchar(10),
user_appr_id Varchar(10),
user_appr_name_first Varchar(20),
user_appr_name_last Varchar(30),
user_appr_ref Varchar(40),
user_appr_mailstop Varchar(10),
user_approvals Varchar(10),
user_country Varchar(10),
user_address1 Varchar(90),
user_address2 Varchar(60),
user_mailstop Varchar(10),
user_city Varchar(30),
user_state Varchar(30),
user_zip Varchar(20),
user_hire_dt_orig Varchar(20),
user_hire_dt_last Varchar(20),
user_birth_dt Varchar(10),
user_tenure_months Varchar(10),
user_exempt Varchar(10),
user_gender Varchar(20),
user_ethnicity Varchar(10),
user_company_no Varchar(10),
user_phone_work Varchar(30),
user_phone_home Varchar(20),
user_phone_mobile Varchar(30),
user_phone_fax Varchar(10),
user_has_photo Varchar(10),
applicant_archived_flag Varchar(10),
user_last_login Varchar(20),
user_mgr_id2 Varchar(10),
indirect_manager_name Varchar(40),
indirect_manager_ref Varchar(30),
user_mgr_name_first2 Varchar(20),
user_mgr_name_last2 Varchar(30),
user_mgr_email2 Varchar(40),
user_language_id Varchar(10),
user_create_dt Varchar(30),
user_guid Varchar(40),
user_termination_dt Varchar(10),
user_eligible_for_rehire Varchar(10),
user_type Varchar(20),
user_termination_type Varchar(10),
user_sub_category_id Varchar(10),
user_leave_reason_id Varchar(10),
user_termination_reason_id Varchar(10),
user_tax_override Varchar(10),
user_tax_override_unit Varchar(10),
user_vat_number Varchar(10),
user_employment_status_id Varchar(10),
user_category_id Varchar(10),
user_local_system_id Varchar(128),
user_personal_email Varchar(128),
user_is_rehired_employee Varchar(10),
user_modify_date Varchar(30),
user_timezone_id Varchar(10),
user_activation_dt Varchar(20),
user_deactivation_dt Varchar(20),
last_touched_dt_utc Varchar(30),
Source_Filename Varchar(200)

)
;

CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_corner_stone_user
(
user_id Varchar(10),
user_name_first Varchar(128),
user_name_last Varchar(128),
user_ref Varchar(40),
user_login Varchar(50),
user_email Varchar(128),
user_absent Boolean,
user_allow_reconcile Boolean,
user_name_prefix Varchar(10),
user_name_suffix Varchar(10),
user_name_middle Varchar(30),
user_status_id NUMBER,
user_mgr_id Varchar(10),
user_mgr_name_first Varchar(128),
user_mgr_name_last Varchar(128),
user_mgr_ref Varchar(128),
user_mgr_email Varchar(128),
user_mgr_mailstop Varchar(10),
user_appr_id NUMBER,
user_appr_name_first Varchar(20),
user_appr_name_last Varchar(30),
user_appr_ref Varchar(40),
user_appr_mailstop Varchar(10),
user_approvals Varchar(10),
user_country Varchar(10),
user_address1 Varchar(90),
user_address2 Varchar(60),
user_mailstop Varchar(10),
user_city Varchar(30),
user_state Varchar(30),
user_zip Varchar(20),
user_hire_dt_orig DATE,
user_hire_dt_last DATE,
user_birth_dt DATE,
user_tenure_months NUMBER,
user_exempt Boolean,
user_gender Varchar(20),
user_ethnicity Varchar(10),
user_company_no Varchar(10),
user_phone_work Varchar(30),
user_phone_home Varchar(20),
user_phone_mobile Varchar(30),
user_phone_fax Varchar(10),
user_has_photo Boolean,
applicant_archived_flag Boolean,
user_last_login timestamp_ntz,
user_mgr_id2 NUMBER,
indirect_manager_name Varchar(40),
indirect_manager_ref Varchar(30),
user_mgr_name_first2 Varchar(20),
user_mgr_name_last2 Varchar(30),
user_mgr_email2 Varchar(40),
user_language_id Varchar(10),
user_create_dt timestamp_ntz,
user_guid Varchar(40),
user_termination_dt Varchar(10),
user_eligible_for_rehire Varchar(10),
user_type Varchar(20),
user_termination_type Varchar(10),
user_sub_category_id Varchar(10),
user_leave_reason_id Varchar(10),
user_termination_reason_id Varchar(10),
user_tax_override Varchar(10),
user_tax_override_unit Varchar(10),
user_vat_number Varchar(10),
user_employment_status_id Varchar(10),
user_category_id Varchar(10),
user_local_system_id Varchar(128),
user_personal_email Varchar(128),
user_is_rehired_employee Varchar(10),
user_modify_date timestamp_ntz,
user_timezone_id Varchar(10),
user_activation_dt Varchar(20),
user_deactivation_dt Varchar(20),
last_touched_dt_utc timestamp_ntz,
Source_FileName Varchar(200),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;
truncate table "PO_STAGE_DB"."ld".po_corner_stone_user_stage;

create or replace pipe PO_STAGE_DB."survey".p_corner_stone_user_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."ld".po_corner_stone_user_stage
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE) 
pattern = '.*CORNERSTONE_RPT_User_page_33.*.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

show tasks;

/*stream for exit*/
create or replace stream "PO_STAGE_DB"."ld".s_corner_stone_user_load
COPY GRANTS on table "PO_STAGE_DB"."ld".po_corner_stone_user_stage
APPEND_ONLY = TRUE
;


/*Task for cs user*/
create or replace task "PO_HRIS_DB"."ld".t_corner_stone_user_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 9 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('PO_STAGE_DB."ld".s_corner_stone_user_load')
as 
Call sp_corner_stone_user_load((to_char(current_date -1,'YYYYMMDD') )::int)
;

alter task "PO_HRIS_DB"."ld".t_corner_stone_user_load resume;


select * from "PO_HRIS_DB"."ld".po_corner_stone_user limit 1;2024-01-25 08:19:36.325

select 
* from delete from "PO_STAGE_DB"."ld".po_corner_stone_user_stage limit 1;

  select *
  from table(information_schema.task_history()) 
  order by scheduled_time;
  
drop table PO_HRIS_DB."ld".TT_CS_USER_RK;

//DROP PROCEDURE PO_STAGE_DB."ld".sp_corner_stone_training_load(NUMBER);

CREATE OR REPLACE PROCEDURE sp_corner_stone_user_load(Batch_ID int)
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


truncate table "PO_HRIS_DB"."ld".po_corner_stone_user;

create or replace temp table tt_cs_user_rk  as 
select *,row_number() over(partition by user_id order by user_modify_date desc ) rk 
from "PO_STAGE_DB"."ld".po_corner_stone_user_stage
;

INSERT INTO "PO_HRIS_DB"."ld".po_corner_stone_user
(
user_id,
user_name_first,
user_name_last,
user_ref,
user_login,
user_email,
user_absent,
user_allow_reconcile,
user_name_prefix,
user_name_suffix,
user_name_middle,
user_status_id,
user_mgr_id,
user_mgr_name_first,
user_mgr_name_last,
user_mgr_ref,
user_mgr_email,
user_mgr_mailstop,
user_appr_id,
user_appr_name_first,
user_appr_name_last,
user_appr_ref,
user_appr_mailstop,
user_approvals,
user_country,
user_address1,
user_address2,
user_mailstop,
user_city,
user_state,
user_zip,
user_hire_dt_orig,
user_hire_dt_last,
user_birth_dt,
user_tenure_months,
user_exempt,
user_gender,
user_ethnicity,
user_company_no,
user_phone_work,
user_phone_home,
user_phone_mobile,
user_phone_fax,
user_has_photo,
applicant_archived_flag,
user_last_login,
user_mgr_id2,
indirect_manager_name,
indirect_manager_ref,
user_mgr_name_first2,
user_mgr_name_last2,
user_mgr_email2,
user_language_id,
user_create_dt,
user_guid,
user_termination_dt,
user_eligible_for_rehire,
user_type,
user_termination_type,
user_sub_category_id,
user_leave_reason_id,
user_termination_reason_id,
user_tax_override,
user_tax_override_unit,
user_vat_number,
user_employment_status_id,
user_category_id,
user_local_system_id,
user_personal_email,
user_is_rehired_employee,
user_modify_date,
user_timezone_id,
user_activation_dt,
user_deactivation_dt,
last_touched_dt_utc,
Source_FileName,
Created_Date ,
Created_By ,
Modified_Date ,
Modifeid_By ,
Batch_ID 
)
SELECT
user_id,
user_name_first,
user_name_last,
user_ref,
user_login,
user_email,
user_absent,
user_allow_reconcile,
user_name_prefix,
user_name_suffix,
user_name_middle,
user_status_id,
user_mgr_id,
user_mgr_name_first,
user_mgr_name_last,
user_mgr_ref,
user_mgr_email,
user_mgr_mailstop,
user_appr_id,
user_appr_name_first,
user_appr_name_last,
user_appr_ref,
user_appr_mailstop,
user_approvals,
user_country,
user_address1,
user_address2,
user_mailstop,
user_city,
user_state,
user_zip,
user_hire_dt_orig,
user_hire_dt_last,
user_birth_dt,
user_tenure_months,
user_exempt,
user_gender,
user_ethnicity,
user_company_no,
user_phone_work,
user_phone_home,
user_phone_mobile,
user_phone_fax,
user_has_photo,
applicant_archived_flag,
user_last_login,
user_mgr_id2,
indirect_manager_name,
indirect_manager_ref,
user_mgr_name_first2,
user_mgr_name_last2,
user_mgr_email2,
user_language_id,
user_create_dt,
user_guid,
user_termination_dt,
user_eligible_for_rehire,
user_type,
user_termination_type,
user_sub_category_id,
user_leave_reason_id,
user_termination_reason_id,
user_tax_override,
user_tax_override_unit,
user_vat_number,
user_employment_status_id,
user_category_id,
user_local_system_id,
user_personal_email,
user_is_rehired_employee,
user_modify_date,
user_timezone_id,
user_activation_dt,
user_deactivation_dt,
last_touched_dt_utc,
Source_filename,
:created_datetime ,
:created_by ,
:modified_datetime ,
:modified_by ,
:Batch_ID 
from tt_cs_user_rk r left join "PO_HRIS_DB"."ld".po_corner_stone_user u on u.user_id = r.user_id
where r.rk =1 
//"PO_STAGE_DB"."ld".po_corner_stone_training_stage
;

Truncate table "PO_STAGE_DB"."ld".po_corner_stone_user_stage;

Return 'Done';

  END;
  $$;

alter task "PO_HRIS_DB"."ld".t_corner_stone_user_load suspend;

select
max(length(user_id)) ,
max(length(user_name_first)) ,
max(length(user_name_last)) ,
max(length(user_ref)) ,
max(length(user_login)) ,
max(length(user_email)) ,
max(length(user_absent)) ,
max(length(user_allow_reconcile)) ,
max(length(user_name_prefix)) ,
max(length(user_name_suffix)) ,
max(length(user_name_middle)) ,
max(length(user_status_id)) ,
max(length(user_mgr_id)) ,
max(length(user_mgr_name_first)) ,
max(length(user_mgr_name_last)) ,
max(length(user_mgr_ref)) ,
max(length(user_mgr_email)) ,
max(length(user_mgr_mailstop)) ,
max(length(user_appr_id)) ,
max(length(user_appr_name_first)) ,
max(length(user_appr_name_last)) ,
max(length(user_appr_ref)) ,
max(length(user_appr_mailstop)) ,
max(length(user_approvals)) ,
max(length(user_country)) ,
max(length(user_address1)) ,
max(length(user_address2)) ,
max(length(user_mailstop)) ,
max(length(user_city)) ,
max(length(user_state)) ,
max(length(user_zip)) ,
max(length(user_hire_dt_orig)) ,
max(length(user_hire_dt_last)) ,
max(length(user_birth_dt)) ,
max(length(user_tenure_months)) ,
max(length(user_exempt)) ,
max(length(user_gender)) ,
max(length(user_ethnicity)) ,
max(length(user_company_no)) ,
max(length(user_phone_work)) ,
max(length(user_phone_home)) ,
max(length(user_phone_mobile)) ,
max(length(user_phone_fax)) ,
max(length(user_has_photo)) ,
max(length(applicant_archived_flag)) ,
max(length(user_last_login)) ,
max(length(user_i_mgr_id)) ,
max(length(indirect_manager_name)) ,
max(length(indirect_manager_ref)) ,
max(length(user_i_mgr_name_first)) ,
max(length(user_i_mgr_name_last)) ,
max(length(user_i_mgr_email)) ,
max(length(user_language_id)) ,
max(length(user_create_dt)) ,
max(length(user_guid)) ,
max(length(user_termination_dt)) ,
max(length(user_eligible_for_rehire)) ,
max(length(user_type)) ,
max(length(user_termination_type)) ,
max(length(user_sub_category_id)) ,
max(length(user_leave_reason_id)) ,
max(length(user_termination_reason_id)) ,
max(length(user_tax_override)) ,
max(length(user_tax_override_unit)) ,
max(length(user_vat_number)) ,
max(length(user_employment_status_id)) ,
max(length(user_category_id)) ,
max(length(user_local_system_id)) ,
max(length(user_personal_email)) ,
max(length(user_is_rehired_employee)) ,
max(length(user_modify_date)) ,
max(length(user_timezone_id)) ,
max(length(user_activation_dt)) ,
max(length(user_deactivation_dt)) ,
max(length(last_touched_dt_utc)) 
from "PO_STAGE_DB"."ld".po_corner_stone_user_stage
;
select * from "PO_STAGE_DB"."ld".po_corner_stone_user_stage limit 2000;



Select 
*
//count(*), source_filename
//count(distinct user_id)--32504
//count(*), user_id
From
"PO_STAGE_DB"."ld".po_corner_stone_user_stage where source_filename like '%page_33%'
and user_name_first like '%David%'
//user_id = '-200'
//lo_object_id <> lo_root_id--root id is different
//trim(upper(LO_TITLE))<>trim(upper(LO_Root_Title))--both are same
//LO_Status_type<>LO_Status--both are same
group by 2 having count(*) < 33
//limit 100
;

-200


CORNERSTONE_RPT_User_page_1_20240105.csv
