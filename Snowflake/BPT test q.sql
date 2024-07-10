
//Case 1: On leave is Yes and Business reason is termination

//When request leave of absence reason changes only on leave field?

//Do we need currency and amount? 2) what is assign pay group?

select distinct employee_id,initiated_dt,effective_dt, business_process_reason,business_process_reason_category,business_process_type,Curr_Pay_Grp,Prop_Pay_Grp ,term_date,On_leave,prop_job_family,prop_job_family_grp,*
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'
and employee_id is not null --and On_Leave = 'Yes'
and employee_id  = '714523';



// Assign pay grp what is it? 

select distinct employee_id,initiated_dt,effective_dt, business_process_reason,business_process_reason_category,business_process_type,Curr_Pay_Grp,Prop_Pay_Grp ,term_date,On_leave,prop_job_family,prop_job_family_grp,curr_management_level,prop_management_level,curr_management_level_ref_id,prop_management_level_ref_id,candidate_id,*
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'
and employee_id is not null --and On_Leave = 'Yes'
and employee_id  = '99003453' and business_process_type <> 'Assign Pay Group';

//curr_management_level,prop_management_level,curr_management_level_ref_id,prop_management_level_ref_id-- same values assigned with numbers for new hires
// create level id as temp table

select distinct Prop_Manager_Email,employee_id,initiated_dt,effective_dt, business_process_reason,business_process_reason_category,business_process_type,curr_management_level,prop_management_level,curr_management_level_ref_id,prop_management_level_ref_id,candidate_id,*
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'
and employee_id is not null and curr_management_level <> curr_management_level_ref_id ;

//Intiated date vs eff date, inti date is less than eff date 
//Term date less than hire date, it means rehire?
//Why Org level or benefit code are nulls?
//When Source field is null? 
//Prop_Hourly_Rate_Currency is null


select distinct 
Curr_Time_Type,
Prop_Time_Type,
Curr_Job_Exempt,
Prop_Job_Exempt,

Original_Hire_Dt,Continuous_Service_Dt,curr_job_code,Prop_Job_Code,curr_job_title,Prop_Business_Title,
Curr_Job_Family,
Prop_Job_Family

,Org_Level,SPE_Benefit_Cd,employee_id,initiated_dt,effective_dt, business_process_reason,business_process_reason_category,business_process_type,Curr_Pay_Grp,Prop_Pay_Grp ,term_date,On_leave,prop_job_family,prop_job_family_grp,curr_management_level,prop_management_level,curr_management_level_ref_id,prop_management_level_ref_id,candidate_id,*
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'
and employee_id is not null --and On_Leave = 'Yes'
and employee_id  = '178201';

//Span_Of_Control,direct report what are these and do we need change tracking?

select distinct gender,term_date,race_ethnicity,location,business_partner,generation,Pay_Plan,
Prop_Cost_Center,
Curr_Cost_Center,
Curr_Cost_Element,
Prop_Cost_Element,
Curr_Cost_Element_Ref_ID,
Prop_Cost_Element_Ref_ID,

Work_Address_City,
Work_Address_State,
Work_Address_Zip,
primary_country
,Curr_Region,prop_region,Employee_Class,Aspire_Bonus_Amt_US as Aspire_Bonus_Amt,curr_contingent_worker_type_id,prop_contingent_worker_type_id,
Aspire_Bonus_Currency,
Span_of_Control,last_increase_amt,last_increase_currency,last_increase_amt_dt
,Direct_Reports_Ct,Prop_Manager_Email,curr_base_pay,prop_base_pay,Prop_Base_Pay_Currency,Bonus_Plan,* 
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'  and employee_id is not null and employee_id  = '178201';

//TO capture rehires
select Original_Hire_Dt,hire_dt,termination_dt,active_status, s.candidate_id, s.employee_id,s.workday_id,job_family_func,job_family_grp,job_family,* from PO_Worker_Snapshot S where 
termination_dt < hire_dt and active_status = 'Yes';

//after we process transactions, then process snapshot data monthly
//Age, Report count(check),Span_Of_Control
//and prop_cost_center <> prop_cost_element noth fieds have same values

select distinct direct_reports_ct,span_of_control, employee_id,effective_dt, business_process_reason,business_process_reason_category,business_process_type,initiated_dt,source, *
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'  and employee_id is not null //and SUPERVISORY_ORGANIZATION_PROPOSED like '%Drew%'

and employee_id  = '178201' and BUSINESS_PROCESS_REASON_CATEGORY <> 'Conversion';

--exclude Conversion 


select distinct prop_job_profile, curr_pay_grp,prop_pay_grp ,employee_id,effective_dt,initiated_dt, business_process_reason,business_process_reason_category,business_process_type,initiated_dt,source, *
from Bpt_test where filename = 'Worker_Trans_Report_100123.csv'  and employee_id IN ('100178', '100195')

and
business_process_type like '%Hire%';

select 

1

US1 - 


1
snapshot date

2
Transactional 

3
1245676 08/01/2023 12/31/9999 US1 Manager-A Dept-1
1245676 09/01/2023 12/31/9999 JP1 

//ask about resend


