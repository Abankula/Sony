truncate table PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE;

delete from PO_HRIS_DB."Worker".WORKER_TRANSACTION where effective_dt >= '2024-04-02';



INSERT INTO PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE
(
    Employee_ID,
    Effective_Dt ,
    Business_Process_Reason_Category,
    Business_Process_Reason,
    Business_Process_Type,
    Source,
    Created_Date,
    Created_By,
    Modified_Date ,
    Modifeid_By,
    Batch_ID 
)
Select 
Distinct
    ws.Employee_ID,
    ws.Effective_Dt ,
    ws.Business_Process_Reason_Category,
    ws.Business_Process_Reason,
    ws.Business_Process_Type,
    ws.source,
    CURRENT_TIMESTAMP,
    CURRENT_USER,
    CURRENT_TIMESTAMP,
    CURRENT_USER,
    20240319
From PO_STAGE_DB."Worker".WORKER_TRANSACTION_STAGE ws where Source = 'New Activity';
;


create temp table tmp_wtt as
select  Employee_ID,
    Effective_Dt ,
    Business_Process_Reason_Category,
    Business_Process_Reason,
    Business_Process_Type 
//count(*), employee_id 
from
(select *, row_number() over(partition by employee_id,effective_dt order by business_process_reason desc) rk -- add number logic to business process reason
//count(*), employee_id,effective_dt
from PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE 
where upper(BUSINESS_PROCESS_TYPE) IN ('TERMINATION','TRANSFER EMPLOYEE INBOUND','DEMOTE EMPLOYEE INBOUND','PROMOTE EMPLOYEE INBOUND','HIRE','MOVE WORKER (SUPERVISORY)') and effective_dt between '2024-04-01' and '2024-06-30'
)a where a.rk = 1;





select w.Benefit_Code,contingent_type_proposed,w.source,ws.employee_id,worker_wid,* //row_number() over(partition by w.employee_id,w.effective_dt order by w.source desc) rk 
from PO_HRIS_DB."Worker".WORKER_TRANSACTION w inner join tmp_wtt wt on wt.employee_id = w.employee_id and wt.effective_dt = w.effective_dt and w.source = wt.source
left join PO_HRIS_DB."Worker".po_worker_snapshot ws on w.worker_wid = ws.workday_id and snapshot_dt = '2024-04-18'
where //w.source <> 'Snapshot' and effective_dt between '2024-01-01' and '2024-03-31' and 
ifnull(w.benefit_code,'abc') NOT IN ('N1','N3','A3','A4','A9','A8','B4','B5','B6','N7','A2','A6','N5') and contingent_type_proposed not like '%Intern%'
//in ('Regular','Limited Term (Fixed Term)','Contract - CATS','Union-Limited Term (Fixed Term)','Non-Salary')
and w.employee_id = '95d509b32f92194d4e31409c26db1cd1d90dd6cf78dd1e60d0fb27381d861b738745b42c9173b4e2222b0585c60f6e4eede8a7c47a2c5beedc64bde3f8810afd'
;
limit 10;



INSERT INTO PO_HRIS_DB."Worker".WORKER_TRANSACTION
(
employee_id ,
effective_dt ,
date_and_time_completed , 
date_and_time_initiated ,
correction_dt ,
is_activity ,
is_snapshot ,
active_status ,
age ,
aspire_bonus_amount ,
aspire_bonus_plan ,
aspire_bonus_currency ,
aspire_target_percent ,
base_pay_range_segment ,
benefit_code ,
business_partner_employee_id ,
business_partner_name ,
business_partner_current ,
business_partner_proposed ,
business_title_current ,
business_title_proposed ,
job_title_current ,
job_title_proposed ,
candidate_id ,
base_pay_current ,
base_pay_proposed ,
basis_frequency ,
compensation_grade_current ,
compensation_grade_proposed ,
continuous_service_dt_current ,
continuous_service_dt_proposed ,
currency_current ,
currency_proposed ,
contingent_type_current ,
contingent_type_id_current ,
contingent_type_proposed ,
contingent_type_id_proposed ,
hourly_rate_current ,
hourly_rate_proposed ,
job_profile_current ,
job_profile_id_current ,
job_profile_proposed ,
job_profile_id_proposed ,
default_hours_current ,
default_hours_proposed ,
fte_current ,
fte_proposed ,
paid_fte_current ,
paid_fte_proposed ,
generation ,
gl_account_current ,
gl_account_proposed ,
job_level_current ,
job_level_proposed ,
scheduled_hours_current ,
scheduled_hours_proposed ,
pay_rate_type_current ,
pay_rate_type_id_current ,
pay_rate_type_proposed ,
pay_rate_type_id_proposed ,
time_in_job ,
time_type_current ,
time_type_id_current ,
time_type_proposed ,
time_type_id_proposed ,
contract ,
cost_center_grouping_current ,
cost_center_grouping_name_current ,
cost_center_grouping_id_current ,
cost_center_grouping_proposed ,
cost_center_grouping_name_proposed ,
cost_center_grouping_id_proposed ,
cost_element_id_current ,
cost_element_name_current ,
cost_element_id_proposed ,
cost_element_name_proposed ,
department_current ,
department_id_current ,
department_name_current ,
department_proposed ,
department_id_proposed ,
department_name_proposed ,
disability ,
division_current ,
division_id_current ,
division_name_current ,
division_proposed ,
division_id_proposed ,
division_name_proposed ,
employee_class ,
work_email ,
end_employment_dt ,
event_wid ,
flsa_status ,
gender ,
geographic_group_current ,
geographic_group_proposed ,
hire_dt ,
original_hire_dt ,
hispanic_or_latino ,
initiating_person ,
initiating_person_id ,
job_code_current ,
job_code_proposed ,
job_family_current ,
job_family_proposed ,
job_family_group_current ,
job_family_group_proposed ,
ltip_bonus_amount ,
ltip_currency ,
last_bonus_dt ,
last_increase_amount ,
last_increase_currency ,
last_increase_percent ,
last_increase_dt ,
legacy_compensation_plans_current ,
legacy_compensation_plans_proposed ,
new_compensation_plans_current ,
new_compensation_plans_proposed ,
line_of_business_current ,
line_of_business_id_current ,
line_of_business_name_current ,
line_of_business_proposed ,
line_of_business_id_proposed ,
line_of_business_name_proposed ,
location_id_current ,
location_name_current ,
location_id_proposed ,
location_name_proposed ,
work_address_city ,
work_address_state ,
work_address_country ,
work_address_postal_code ,
job_exempt_current ,
job_exempt_proposed ,
management_level_current ,
management_level_id_current ,
management_level_proposed ,
management_level_id_proposed ,
supervisory_organization_current ,
supervisory_organization_id_current ,
supervisory_organization_proposed ,
supervisory_organization_id_proposed ,
manager_id_current ,
manager_name_current ,
manager_id_proposed ,
manager_name_proposed ,
manager_job_title_current ,
manager_job_title_proposed ,
manager_work_email_current ,
manager_work_email_proposed ,
direct_report_count ,
span_of_control ,
occ_code_current ,
occ_code_proposed ,
on_leave ,
organization_level_code ,
other_id_legacy_current ,
other_id_legacy_proposed ,
other_id_new_current ,
other_id_new_proposed ,
pay_company_current ,
pay_company_id_current ,
pay_company_name_current ,
pay_company_proposed ,
pay_company_id_proposed ,
pay_company_name_proposed ,
pay_group_id_current ,
pay_group_name_current ,
pay_group_id_proposed ,
pay_group_name_proposed ,
pay_plan ,
planning_manager_current ,
planning_manager_id_current ,
planning_manager_name_current ,
planning_manager_proposed ,
planning_manager_id_proposed ,
planning_manager_name_proposed ,
pre_hire_id ,
pre_hire_wid ,
profit_center_current ,
profit_center_id_current ,
profit_center_name_current ,
profit_center_proposed ,
profit_center_id_proposed ,
profit_center_name_proposed ,
race_ethnicity ,
region_current ,
region_proposed ,
regular_temp ,
sap_company_current ,
sap_company_id_current ,
sap_company_name_current ,
sap_company_proposed ,
sap_company_id_proposed ,
sap_company_name_proposed ,
sony_payroll_company_current ,
sony_payroll_company_id_current ,
sony_payroll_company_name_current ,
sony_payroll_company_proposed ,
sony_payroll_company_id_proposed ,
sony_payroll_company_name_proposed ,
source ,
union_local_name ,
union_code ,
sub_department_current ,
sub_department_id_current ,
sub_department_name_current ,
sub_department_proposed ,
sub_department_id_proposed ,
sub_department_name_proposed ,
sub_division_current ,
sub_division_id_current ,
sub_division_name_current ,
sub_division_proposed ,
sub_division_id_proposed ,
sub_division_name_proposed ,
termination_dt ,
trended_record_dt ,
veteran_status ,
worker_wid ,
Source_Filename,
Created_Date,
Created_By,
Modified_Date ,
Modifeid_By,
Batch_ID 
)
select
employee_id ,
effective_dt ,
date_and_time_completed ,
date_and_time_initiated ,
correction_dt ,
is_activity ,
is_snapshot ,
active_status , -- yes from legacy, true from new  values coming from 
age ,
aspire_bonus_amount ,
aspire_bonus_plan ,
aspire_bonus_currency ,
aspire_target_percent ,
base_pay_range_segment ,
benefit_code ,
business_partner_employee_id ,
business_partner_name ,
business_partner_current ,
business_partner_proposed ,
business_title_current ,
business_title_proposed ,
job_title_current ,
job_title_proposed ,
candidate_id ,
base_pay_current ,
base_pay_proposed ,
basis_frequency ,
compensation_grade_current ,
compensation_grade_proposed ,
continuous_service_dt_current ,
continuous_service_dt_proposed ,
currency_current ,
currency_proposed ,
contingent_type_current ,
contingent_type_id_current ,
contingent_type_proposed ,
contingent_type_id_proposed ,
hourly_rate_current ,
hourly_rate_proposed ,
job_profile_current ,
job_profile_id_current ,
job_profile_proposed ,
job_profile_id_proposed ,
default_hours_current ,
default_hours_proposed ,
fte_current ,
fte_proposed ,
paid_fte_current ,
paid_fte_proposed ,
generation ,
gl_account_current ,
gl_account_proposed ,
job_level_current ,
job_level_proposed ,
scheduled_hours_current ,
scheduled_hours_proposed ,
pay_rate_type_current ,
pay_rate_type_id_current ,
pay_rate_type_proposed ,
pay_rate_type_id_proposed ,
time_in_job ,
time_type_current ,
time_type_id_current ,
time_type_proposed ,
time_type_id_proposed ,
contract ,
cost_center_grouping_current ,
cost_center_grouping_name_current ,
cost_center_grouping_id_current ,
cost_center_grouping_proposed ,
cost_center_grouping_name_proposed ,
cost_center_grouping_id_proposed ,
cost_element_id_current ,
cost_element_name_current ,
cost_element_id_proposed ,
cost_element_name_proposed ,
department_current ,
department_id_current ,
department_name_current ,
department_proposed ,
department_id_proposed ,
department_name_proposed ,
disability ,
division_current ,
division_id_current ,
division_name_current ,
division_proposed ,
division_id_proposed ,
division_name_proposed ,
employee_class ,
work_email ,
end_employment_dt ,
event_wid ,
flsa_status ,
gender ,
geographic_group_current ,
geographic_group_proposed ,
hire_dt ,
original_hire_dt ,
hispanic_or_latino ,
initiating_person ,
initiating_person_id ,
job_code_current ,
job_code_proposed ,
job_family_current ,
job_family_proposed ,
job_family_group_current ,
job_family_group_proposed ,
ltip_bonus_amount ,
ltip_currency ,
last_bonus_dt ,
last_increase_amount ,
last_increase_currency ,
last_increase_percent ,
last_increase_dt ,
legacy_compensation_plans_current ,
legacy_compensation_plans_proposed ,
new_compensation_plans_current ,
new_compensation_plans_proposed ,
line_of_business_current ,
line_of_business_id_current ,
line_of_business_name_current ,
line_of_business_proposed ,
line_of_business_id_proposed ,
line_of_business_name_proposed ,
location_id_current ,
location_name_current ,
location_id_proposed ,
location_name_proposed ,
work_address_city ,
work_address_state ,
work_address_country ,
work_address_postal_code ,
job_exempt_current ,
job_exempt_proposed ,
management_level_current ,
management_level_id_current ,
management_level_proposed ,
management_level_id_proposed ,
supervisory_organization_current ,
supervisory_organization_id_current ,
supervisory_organization_proposed ,
supervisory_organization_id_proposed ,
manager_id_current ,
manager_name_current ,
manager_id_proposed ,
manager_name_proposed ,
manager_job_title_current ,
manager_job_title_proposed ,
manager_work_email_current ,
manager_work_email_proposed ,
direct_report_count ,
span_of_control ,
occ_code_current ,
occ_code_proposed ,
on_leave ,
organization_level_code ,
other_id_legacy_current ,
other_id_legacy_proposed ,
other_id_new_current ,
other_id_new_proposed ,
pay_company_current ,
pay_company_id_current ,
pay_company_name_current ,
pay_company_proposed ,
pay_company_id_proposed ,
pay_company_name_proposed ,
pay_group_id_current ,
pay_group_name_current ,
pay_group_id_proposed ,
pay_group_name_proposed ,
pay_plan ,
planning_manager_current ,
planning_manager_id_current ,
planning_manager_name_current ,
planning_manager_proposed ,
planning_manager_id_proposed ,
planning_manager_name_proposed ,
pre_hire_id ,
pre_hire_wid ,
profit_center_current ,
profit_center_id_current ,
profit_center_name_current ,
profit_center_proposed ,
profit_center_id_proposed ,
profit_center_name_proposed ,
race_ethnicity ,
region_current ,
region_proposed ,
regular_temp ,
sap_company_current ,
sap_company_id_current ,
sap_company_name_current ,
sap_company_proposed ,
sap_company_id_proposed ,
sap_company_name_proposed ,
sony_payroll_company_current ,
sony_payroll_company_id_current ,
sony_payroll_company_name_current ,
sony_payroll_company_proposed ,
sony_payroll_company_id_proposed ,
sony_payroll_company_name_proposed ,
source ,
union_local_name ,
union_code ,
sub_department_current ,
sub_department_id_current ,
sub_department_name_current ,
sub_department_proposed ,
sub_department_id_proposed ,
sub_department_name_proposed ,
sub_division_current ,
sub_division_id_current ,
sub_division_name_current ,
sub_division_proposed ,
sub_division_id_proposed ,
sub_division_name_proposed ,
termination_dt ,
trended_record_dt ,
veteran_status ,
worker_wid ,
Source_Filename,
CURRENT_TIMESTAMP,
CURRENT_USER,
CURRENT_TIMESTAMP,
CURRENT_USER,
20240319
from
(
select 
*,row_number() over(partition by employee_id,effective_dt::date,source order by date_and_time_completed::date ) as rk
From PO_STAGE_DB."Worker".WORKER_TRANSACTION_STAGE ws
//where source_filename = 'outbound/WD_Business_Process_Trans_202401_202403_20240421_hashed.csv'
 )A where a.rk =1 and Source = 'New Activity';

select max(effective_dt)From PO_STAGE_DB."Worker".WORKER_TRANSACTION_STAGE