--Snapshot view
--benefit code changes
alter table WD_Snapshot_History
add column Core_HC Varchar(30);
alter table WD_Snapshot_History
add column All_HC Varchar(30);

select * from WD_Snapshot_History where snapshot_dt = '2022-12-31' and employee_type = 'Joint Venture' and active_status and annual_base_pay <> '0.00';

select count(*), core_hc from vw_wd_snapshot where snapshot_dt = '2022-12-31' and active_status and contingent_worker_type is null group by 2;

select benefit_code,benefit_description,* from vw_wd_snapshot where snapshot_dt = '2022-12-31' and employee_id = '0a41094b60c13389db6f0a86ea27919ca8ef82a0ae7c92a2b2874e93921822324217b44946c667f089ff1d34ac70082152835b79aa175b111775716d087e2827'

active_status and contingent_worker_type is null group by 2

select distinct WORK_CITY
 ,snapshot_dt  from TABLEAU.PUBLIC.VW_WD_SNAPSHOT where snapshot_dt = '2022-12-31' and upper(WORK_CITY) like '%CULVER%'; limit 10;

select * from 

create or replace table WD_Snapshot_History as
select *,
reverse(SPLIT_PART(Hierarchy, ',', 1)) AS Hierarchy_1,
  reverse(SPLIT_PART(Hierarchy, ',', 2)) AS Hierarchy_2 ,
    reverse(SPLIT_PART(Hierarchy, ',', 3)) AS Hierarchy_3,
  reverse(SPLIT_PART(Hierarchy, ',', 4)) AS Hierarchy_4,
  reverse(SPLIT_PART(Hierarchy, ',', 5)) AS Hierarchy_5,
  reverse(SPLIT_PART(Hierarchy, ',', 6)) AS Hierarchy_6,
  reverse(SPLIT_PART(Hierarchy, ',', 7) )AS Hierarchy_7,
  reverse(SPLIT_PART(Hierarchy, ',', 8) )AS Hierarchy_8,
  reverse(SPLIT_PART(Hierarchy, ',', 9) )AS Hierarchy_9,
  reverse(SPLIT_PART(Hierarchy, ',', 10) )AS Hierarchy_10 from 
(select o.*,
case when o.employee_type like '%Contract%' and o.benefit_code like '%VB3%' then  'Limited Term'
when o.employee_type like '%Contract%' and o.benefit_code not like '%VB3%' then  'Regular'
when o.employee_type = 'Union' and o.union_local_name is not null and o.end_employment_dt is null then 'Regular'
when o.employee_type = 'Union-Limited Term' and o.end_employment_dt is not null then 'Limited Term'
when o.employee_type IN  ('Wholly Owned Subsidiary','Regular') then  'Regular' 
when o.employee_type = 'Loan Out' then 'Loan Out'
when o.employee_type = 'Intern/Trainee' then 'Intern'
when o.employee_type = 'Limited Term' then 'Limited Term'
when o.employee_type = 'Joint Venture' and ANNUAL_BASE_PAY <> '0.00' then  'Regular' 
else null end
as derived_emp_type,
//n.employee_type as Future_Employee_Type,
case when a.BENEFIT_DESCRIPTION is null then o.BENEFIT_CODE else BENEFIT_DESCRIPTION end as BENEFIT_DESCRIPTION,
reverse(replace(ifnull(Hierarchy_L1 ,'abc') ||','||
ifnull(Hierarchy_L2,'abc')   ||','||
ifnull(Hierarchy_L3,'abc')   ||','||
ifnull(Hierarchy_L4 ,'abc')  ||','||
ifnull(Hierarchy_L5 ,'abc')  ||','||
ifnull(Hierarchy_L6 ,'abc')  ||','||
ifnull(Hierarchy_L7 ,'abc')  ||','||
ifnull(Hierarchy_L8 ,'abc')  ||','||
ifnull(Hierarchy_L9 ,'abc')  ||','||
ifnull(Hierarchy_L10 ,'abc'),',abc','' )) as Hierarchy
//n.employee_id as Source_Emp_ID  
from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT o
left join
(select distinct REGEXP_SUBSTR(Benefit_Code, '^[^ ]+', 1, 1, 'e') as Benefit_Code, Benefit_Code as Benefit_Description  from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT where snapshot_dt >= '2023-01-31'
union
select 'G4','G4-Regular Corporate - 4G Employee'union
select 'I2','I2-US Expats (US payroll)'union
select 'I5','I5-International Project Hire (IPH)'union
select 'N1','N1-Interns (paid)'union
select 'A4','A4-Production Hire'union
select 'A8','A8-Transitioning Executives'union
select 'B4','B4-Creative Services Production'
)a on o.benefit_code = REGEXP_SUBSTR(a.Benefit_Code, '^[^ ]+', 1, 1, 'e')
//left join (select *,row_number() over (partition by employee_id,snapshot_dt order by hire_dt desc) as rk from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT) n 
//on o.employee_id = n.employee_id 
//and n.snapshot_dt = '2023-01-31' 
//and n.rk =1
//left join PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE t on t.employee_id = o.employee_id and business_process_type like '%Termination%' 
//and effective_dt between '2022-12-31' and '2023-01-31'
where o.snapshot_dt <= '2022-12-31')a;

//and n.employee_id is not null and REGEXP_SUBSTR(n.benefit_code, '^[^ ]+', 1, 1, 'e') <> o.benefit_code and o.EMPLOYEE_TYPE = 'Contract - CATS'

update select distinct BENEFIT_DESCRIPTION from WD_Snapshot_History
derived_emp_type = Future_Employee_Type
where 

;
select distinct employee_type from TABLEAU.PUBLIC.WD_Snapshot_History;

Update WD_Snapshot_History w
set Core_HC = case when (ifnull(benefit_description,'abc') IN ('A1 Regular Corp FT US/PR','B3 Show Hire US','C1 Local 174 (SPE Interim Med Benefits) US','N4 Publicists/Story Analysis US','N6 Local 174 (MPIHP) US','VA1 Staff Hire CAN') and ifnull(employee_type,'abc') IN ('Regular','Loan Out','Limited Term','Contract - CATS','Intern/Trainee')) Then 'True' else 'False' end ,
All_HC = case when (ifnull(benefit_description,'abc') NOT IN ('N7 No Benefits US','VN7 No Benefits CAN') and ifnull(employee_type,'abc') NOT IN ('Regular','Loan Out','Limited Term','Contract - CATS','Intern/Trainee')) Then 'False' else  'True' end,
modifeid_by = current_user, modified_date = current_timestamp;


select * from TABLEAU."survey".VW_EXIT_SURVEY

Update WD_Snapshot_History w
set //benefit_description = future_ben_code,
derived_emp_type = future_emp_type, 
modifeid_by = current_user, modified_date = current_timestamp
from
(
select  n.employee_type as future_emp_type,n.benefit_code as future_ben_code,w.*
//distinct w.pay_frequency,w.benefit_code,w.benefit_description,w.Future_Employee_Type,w.derived_emp_type,w.employee_type,o.benefit_code as "10312023",ws.benefit_code as "05092024",o.active_status,ws.active_status as //latest_Actv_status,ws.termination_dt ,w.*
from WD_Snapshot_History w
//inner join PO_STAGE_DB."Worker".PO_WORKER_SNAPSHOT_20231203 o on   o.snapshot_dt = '2023-10-31' and o.employee_id = w.employee_id
left join (select *,row_number() over (partition by employee_id,snapshot_dt order by hire_dt desc) as rk from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT) n 
on w.employee_id = n.employee_id 
and n.snapshot_dt = '2023-01-31'  
and n.rk =1
//and Future_Employee_Type<>derived_emp_type  
//and REGEXP_SUBSTR(n.Benefit_Code, '^[^ ]+', 1, 1, 'e') <> w.benefit_code-- unomment to update benefit codes
//and w.EMPLOYEE_TYPE = 'Contract - CATS' 
//and o.active_status 
where w.snapshot_dt = '2022-12-31'
and n.employee_type <> w.derived_emp_type  
and n.employee_id is not null
//and REGEXP_SUBSTR(n.Benefit_Code, '^[^ ]+', 1, 1, 'e') <> w.benefit_code
)a where a.employee_id = w.employee_id and a.employee_type = w.employee_type and w.benefit_code = a.benefit_code ;







NEw
b2c8c2e65f2f1002065117e701910004

Old: 
22c54f3fbddd10003df7ab68c4f40001

select distinct region from vw_wd_snapshot limit 1;

select max(snapshot_dt) from 
PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT;
--WD_Worker_Snapshot 
where snapshot_dt = '2024-06-27' //and workday_id = '80afc79ef2c0100207306b21c0a90003'

and employee_id ='95cd0b1ec3e57f3fe52169d6d3ad8aa4b5df01be9caaadb231c9f745bede834057c886b32a91ad666a6310e13a7ffaca1630481d8e52cf866d2461ac466598da'
;






workday_id = '22c54f3fbddd10003df7ab68c4f40001'

//snapshot clean up
;

Create table WD_Worker_Snapshot as 
//create or replace view vw_wd_snapshot as 

union all
select Snapshot_Dt  ,
Employee_ID  ,
Workday_ID  ,
Candidate_ID  ,
SPE_Business_Unit  ,
SPE_Division  ,
SPE_Sub_Division  ,
SPE_Dept  ,
SPE_Sub_Dept  ,
BENEFIT_DESCRIPTION,
REGEXP_SUBSTR(Org_Level, '^[^ ]+', 1, 1, 'e') as  Org_Level ,
REGEXP_SUBSTR(Management_Level, '[^ ]+ (.*)', 1, 1, 'e') as  Management_Level,
Hire_Dt  ,
Original_Hire_Dt  ,
Continuous_Service_Dt  ,
//Time_in_Job  ,
round(months_between(SNAPSHOT_DT,Hire_Dt)) as Tenure_Months,
Job_Code  ,
Job_Title  ,
Job_Family_Func  ,
Job_Family_Grp  ,
Job_Family  ,
Business_Title  ,
Exempt  ,
FTE   ,
Time_Type  ,
Pay_Rate_Type  ,
Pay_Frequency  ,
Hourly_Rate  ,
Hourly_Rate_Currency  ,
Annual_Base_Pay  ,
Annual_Base_Currency  ,
Annual_Base_Pay_US  ,
Aspire_Target_Percentage  ,
Aspire_Bonus_Plan  ,
Aspire_Bonus  ,
Aspire_Bonus_Currency  ,
Aspire_Bonus_Plan_US  ,
Supervisory_Org  ,
Hierarchy_1  ,
Hierarchy_2  ,
Hierarchy_3  ,
Hierarchy_4  ,
Hierarchy_5  ,
Hierarchy_6  ,
Hierarchy_7  ,
Hierarchy_8  ,
Hierarchy_9  ,
Hierarchy_10  ,
Manager_Job_Title  ,
Manager_Work_Email  ,
Manager_Gender  ,
Direct_Reports  ,
Span_of_Control  ,
Last_Base_Pay_Increase  ,
Last_Base_Pay_Increase_Currency  ,
Last_Base_Pay_Increase_US  ,
Last_Base_Pay_Increase_Dt  ,
Last_Base_Pay_Increase_Percent  ,
One_Time_Payment_Dt  ,
LTIP_Plan_Amt  ,
LTIP_Plan_Currency  ,
derived_emp_type  ,
End_Employment_Dt  ,
Contingent_Worker  ,
Contingent_Worker_Type  ,
Union_Local_Code  ,
Union_Local_Name  ,
Region  ,
INITCAP(Work_City)  as Work_City   ,
Work_State  ,
Work_Postal_Code  ,
Work_Country  ,
Dept_ID  ,
Cost_Center  ,
Cost_Center_Name  ,
Cost_Profit_Center  ,
Cost_Profit_Center_ID  ,
Cost_Element_Superior  ,
Gender  ,
Age  ,
Hispanic_Latino  ,
Race_Ethnicity  ,
Vetaran  ,
Disbaility  ,
Termination_Dt  ,
Work_Location  ,
Is_Voluntary_FG  ,
Business_Partner  ,
Generation  ,
Pay_Company  ,
Base_Pay_Range_Segment  ,
Email  ,
Active_Status  ,
On_Leave  ,
Job_Description  ,
Salary_Plan  ,
Compensation_Grade,
Termination_Dt_all,
Termination_Reason,
Is_Rehire,
dd.fy_quarter,
dd.fiscal_year,
CORE_HC,
ALL_HC
from  PO_HRIS_DB."Calender".DIM_DATE dd 
INNER JOIN WD_Snapshot_History ss on dd.date = ss.snapshot_dt

;
delete from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT where snapshot_dt >= '2024-06-25'
;
select distinct termination_reason from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT where termination_reason like '%Employee>%';

Update TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
set termination_reason = replace(termination_reason,'>', ' > ')
 where termination_reason like '%Employee>%';

;


INSERT INTO TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
(
SNAPSHOT_DT,
EMPLOYEE_ID,
WORKDAY_ID,
CANDIDATE_ID,
SPE_BUSINESS_UNIT,
SPE_DIVISION,
SPE_SUB_DIVISION,
SPE_DEPT,
SPE_SUB_DEPT,
BENEFIT_CODE,
ORG_LEVEL,
MANAGEMENT_LEVEL,
HIRE_DT,
ORIGINAL_HIRE_DT,
CONTINUOUS_SERVICE_DT,
TENURE_MONTHS,
JOB_CODE,
JOB_TITLE,
JOB_FAMILY_FUNC,
JOB_FAMILY_GRP,
JOB_FAMILY,
BUSINESS_TITLE,
EXEMPT,
FTE,
TIME_TYPE,
PAY_RATE_TYPE,
PAY_FREQUENCY,
HOURLY_RATE,
HOURLY_RATE_CURRENCY,
ANNUAL_BASE_PAY,
ANNUAL_BASE_CURRENCY,
ANNUAL_BASE_PAY_US,
ASPIRE_TARGET_PERCENTAGE,
ASPIRE_BONUS_PLAN,
ASPIRE_BONUS,
ASPIRE_BONUS_CURRENCY,
ASPIRE_BONUS_PLAN_US,
SUPERVISORY_ORG,
HIERARCHY_1,
HIERARCHY_2,
HIERARCHY_3,
HIERARCHY_4,
HIERARCHY_5,
HIERARCHY_6,
HIERARCHY_7,
HIERARCHY_8,
HIERARCHY_9,
HIERARCHY_10,
MANAGER_JOB_TITLE,
MANAGER_WORK_EMAIL,
MANAGER_GENDER,
DIRECT_REPORTS,
SPAN_OF_CONTROL,
LAST_BASE_PAY_INCREASE,
LAST_BASE_PAY_INCREASE_CURRENCY,
LAST_BASE_PAY_INCREASE_US,
LAST_BASE_PAY_INCREASE_DT,
LAST_BASE_PAY_INCREASE_PERCENT,
ONE_TIME_PAYMENT_DT,
LTIP_PLAN_AMT,
LTIP_PLAN_CURRENCY,
EMPLOYEE_TYPE,
END_EMPLOYMENT_DT,
CONTINGENT_WORKER,
CONTINGENT_WORKER_TYPE,
UNION_LOCAL_CODE,
UNION_LOCAL_NAME,
REGION,
WORK_CITY,
WORK_STATE,
WORK_POSTAL_CODE,
WORK_COUNTRY,
DEPT_ID,
COST_CENTER,
COST_CENTER_NAME,
COST_PROFIT_CENTER,
COST_PROFIT_CENTER_ID,
COST_ELEMENT_SUPERIOR,
GENDER,
AGE,
HISPANIC_LATINO,
RACE_ETHNICITY,
VETARAN,
DISBAILITY,
TERMINATION_DT,
WORK_LOCATION,
IS_VOLUNTARY_FG,
BUSINESS_PARTNER,
GENERATION,
PAY_COMPANY,
BASE_PAY_RANGE_SEGMENT,
EMAIL,
ACTIVE_STATUS,
ON_LEAVE,
JOB_DESCRIPTION,
SALARY_PLAN,
COMPENSATION_GRADE,
TERMINATION_DT_ALL,
TERMINATION_REASON,
IS_REHIRE,
FY_QUARTER,
FISCAL_YEAR,
CORE_HC,
ALL_HC
);
select
Snapshot_Dt  ,
a.Employee_ID  ,
Workday_ID  ,
Candidate_ID  ,
SPE_Business_Unit  ,
SPE_Division  ,
SPE_Sub_Division  ,
SPE_Dept  ,
SPE_Sub_Dept  ,
Benefit_Code,
REGEXP_SUBSTR(Org_Level, '^[^ ]+', 1, 1, 'e') as  Org_Level ,
Management_Level,
Hire_Dt  ,
Original_Hire_Dt  ,
Continuous_Service_Dt  ,
round(months_between(SNAPSHOT_DT,Hire_Dt)) as Tenure_Months,
Job_Code  ,
Job_Title  ,
Job_Family_Func  ,
Job_Family_Grp  ,
Job_Family  ,
Business_Title  ,
Exempt  ,
FTE   ,
Time_Type  ,
Pay_Rate_Type  ,
Pay_Frequency  ,
Hourly_Rate  ,
Hourly_Rate_Currency  ,
Annual_Base_Pay  ,
Annual_Base_Currency  ,
Annual_Base_Pay_US  ,
Aspire_Target_Percentage  ,
Aspire_Bonus_Plan  ,
Aspire_Bonus  ,
Aspire_Bonus_Currency  ,
Aspire_Bonus_Plan_US  ,
Supervisory_Org  ,
reverse(SPLIT_PART(Hierarchy, ',', 1)) AS Hierarchy_1,
  reverse(SPLIT_PART(Hierarchy, ',', 2)) AS Hierarchy_2 ,
    reverse(SPLIT_PART(Hierarchy, ',', 3)) AS Hierarchy_3,
  reverse(SPLIT_PART(Hierarchy, ',', 4)) AS Hierarchy_4,
  reverse(SPLIT_PART(Hierarchy, ',', 5)) AS Hierarchy_5,
  reverse(SPLIT_PART(Hierarchy, ',', 6)) AS Hierarchy_6,
  reverse(SPLIT_PART(Hierarchy, ',', 7) )AS Hierarchy_7,
  reverse(SPLIT_PART(Hierarchy, ',', 8) )AS Hierarchy_8,
  reverse(SPLIT_PART(Hierarchy, ',', 9) )AS Hierarchy_9,
  reverse(SPLIT_PART(Hierarchy, ',', 10) )AS Hierarchy_10 ,
  Manager_Job_Title  ,
Manager_Work_Email  ,
Manager_Gender  ,
Direct_Reports  ,
Span_of_Control  ,
Last_Base_Pay_Increase  ,
Last_Base_Pay_Increase_Currency  ,
Last_Base_Pay_Increase_US  ,
Last_Base_Pay_Increase_Dt  ,
Last_Base_Pay_Increase_Percent  ,
One_Time_Payment_Dt  ,
LTIP_Plan_Amt  ,
LTIP_Plan_Currency  ,
Employee_Type  ,
End_Employment_Dt  ,
Contingent_Worker  ,
Contingent_Worker_Type  ,
Union_Local_Code  ,
Union_Local_Name  ,
Region  ,
INITCAP(Work_City)  as Work_City ,
Work_State  ,
Work_Postal_Code  ,
Work_Country  ,
Dept_ID  ,
Cost_Center  ,
Cost_Center_Name  ,
Cost_Profit_Center  ,
Cost_Profit_Center_ID  ,
Cost_Element_Superior  ,
Gender  ,
Age  ,
Hispanic_Latino  ,
Race_Ethnicity  ,
Vetaran  ,
Disbaility  ,
Termination_Dt  ,
Work_Location  ,
Is_Voluntary_FG  ,
Business_Partner  ,
Generation  ,
Pay_Company  ,
Base_Pay_Range_Segment  ,
Email  ,
Active_Status  ,
On_Leave  ,
Job_Description  ,
Salary_Plan  ,
Compensation_Grade,
Termination_Dt_all,
ifnull(ifnull(concat('Terminate Employee > ',business_process_reason_category,' > ',business_process_reason),l.Termination_Reason),a.Termination_Reason) as Termination_Reason,
Is_Rehire,
fy_quarter,
fiscal_year,
case when (ifnull(benefit_code,'abc') IN ('A1 Regular Corp FT US/PR','B3 Show Hire US','C1 Local 174 (SPE Interim Med Benefits) US','N4 Publicists/Story Analysis US','N6 Local 174 (MPIHP) US','VA1 Staff Hire CAN') or employee_type is not null) Then True else False end as CORE_HC,
case when (ifnull(benefit_code,'abc') NOT IN ('N7 No Benefits US','VN7 No Benefits CAN') or employee_type is null) Then False else  True end as ALL_HC
  from
(select 
reverse(replace(ifnull(Hierarchy_L1 ,'zzzz') ||','||
ifnull(Hierarchy_L2,'zzzz')   ||','||
ifnull(Hierarchy_L3,'zzzz')   ||','||
ifnull(Hierarchy_L4 ,'zzzz')  ||','||
ifnull(Hierarchy_L5 ,'zzzz')  ||','||
ifnull(Hierarchy_L6 ,'zzzz')  ||','||
ifnull(Hierarchy_L7 ,'zzzz')  ||','||
ifnull(Hierarchy_L8 ,'zzzz')  ||','||
ifnull(Hierarchy_L9 ,'zzzz')  ||','||
ifnull(Hierarchy_L10 ,'zzzz'),',zzzz','' )) as Hierarchy,*
from  PO_HRIS_DB."Calender".DIM_DATE dd 
INNER JOIN PO_HRIS_DB."Worker".PO_Worker_Snapshot ss on dd.date = ss.snapshot_dt
where snapshot_dt >= '2024-06-24'//IN (select max(snapshot_dt) from PO_HRIS_DB."Worker".PO_Worker_Snapshot )
)a
left join PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE  wt on wt.employee_id = a.employee_id and upper(wt.BUSINESS_PROCESS_TYPE) like '%TERMINATION%' and effective_dt between '2023-01-01' and '2024-04-14' 
and upper(wt.source) = 'LEGACY ACTIVITY' and a.active_status = 'False'
left join (select employee_id,b.termination_reason from PO_STAGE_DB."Worker".PO_WORKER_SNAPSHOT_20231203 b where snapshot_dt = '2023-10-31') l on l.employee_id = a.employee_id // where a.Termination_Reason is not null
;




alter table WD_WORKER_SNAPSHOT
add column Business_Process_Reason_Category Varchar(500);

alter table WD_WORKER_SNAPSHOT
add column Business_Process_Reason Varchar(500);

alter table WD_WORKER_SNAPSHOT
add column Business_Process_Type Varchar(500);

alter table WD_WORKER_SNAPSHOT
add column Effective_Dt date;

alter table WD_WORKER_SNAPSHOT
add column Category Varchar(500);

update  TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
set category = 'Headcount'
;


insert into TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
(
SNAPSHOT_DT,
Employee_ID,
WORKDAY_ID,
CANDIDATE_ID,
SPE_BUSINESS_UNIT,
SPE_DIVISION,
SPE_SUB_DIVISION,
SPE_DEPT,
SPE_SUB_DEPT,
BENEFIT_CODE,
ORG_LEVEL,
MANAGEMENT_LEVEL,
HIRE_DT,
ORIGINAL_HIRE_DT,
CONTINUOUS_SERVICE_DT,
TENURE_MONTHS,
JOB_CODE,
JOB_TITLE,
JOB_FAMILY_FUNC,
JOB_FAMILY_GRP,
JOB_FAMILY,
BUSINESS_TITLE,
EXEMPT,
FTE,
TIME_TYPE,
PAY_RATE_TYPE,
PAY_FREQUENCY,
HOURLY_RATE,
HOURLY_RATE_CURRENCY,
ANNUAL_BASE_PAY,
ANNUAL_BASE_CURRENCY,
ANNUAL_BASE_PAY_US,
ASPIRE_TARGET_PERCENTAGE,
ASPIRE_BONUS_PLAN,
ASPIRE_BONUS,
ASPIRE_BONUS_CURRENCY,
ASPIRE_BONUS_PLAN_US,
SUPERVISORY_ORG,
HIERARCHY_1,
HIERARCHY_2,
HIERARCHY_3,
HIERARCHY_4,
HIERARCHY_5,
HIERARCHY_6,
HIERARCHY_7,
HIERARCHY_8,
HIERARCHY_9,
HIERARCHY_10,
MANAGER_JOB_TITLE,
MANAGER_WORK_EMAIL,
MANAGER_GENDER,
DIRECT_REPORTS,
SPAN_OF_CONTROL,
LAST_BASE_PAY_INCREASE,
LAST_BASE_PAY_INCREASE_CURRENCY,
LAST_BASE_PAY_INCREASE_US,
LAST_BASE_PAY_INCREASE_DT,
LAST_BASE_PAY_INCREASE_PERCENT,
ONE_TIME_PAYMENT_DT,
LTIP_PLAN_AMT,
LTIP_PLAN_CURRENCY,
EMPLOYEE_TYPE,
END_EMPLOYMENT_DT,
CONTINGENT_WORKER,
CONTINGENT_WORKER_TYPE,
UNION_LOCAL_CODE,
UNION_LOCAL_NAME,
REGION,
WORK_CITY,
WORK_STATE,
WORK_POSTAL_CODE,
WORK_COUNTRY,
DEPT_ID,
COST_CENTER,
COST_CENTER_NAME,
COST_PROFIT_CENTER,
COST_PROFIT_CENTER_ID,
COST_ELEMENT_SUPERIOR,
GENDER,
AGE,
HISPANIC_LATINO,
RACE_ETHNICITY,
VETARAN,
DISBAILITY,
TERMINATION_DT,
WORK_LOCATION,
IS_VOLUNTARY_FG,
BUSINESS_PARTNER,
GENERATION,
PAY_COMPANY,
BASE_PAY_RANGE_SEGMENT,
EMAIL,
ACTIVE_STATUS,
ON_LEAVE,
JOB_DESCRIPTION,
SALARY_PLAN,
COMPENSATION_GRADE,
TERMINATION_DT_ALL,
TERMINATION_REASON,
IS_REHIRE,
FY_QUARTER,
FISCAL_YEAR,
     Effective_Dt ,
    Business_Process_Reason_Category,
    Business_Process_Reason,
    Business_Process_Type,
    Category
)
select  SNAPSHOT_DT,
wtt.Employee_ID,
WORKDAY_ID,
CANDIDATE_ID,
SPE_BUSINESS_UNIT,
SPE_DIVISION,
SPE_SUB_DIVISION,
SPE_DEPT,
SPE_SUB_DEPT,
BENEFIT_CODE,
ORG_LEVEL,
MANAGEMENT_LEVEL,
HIRE_DT,
ORIGINAL_HIRE_DT,
CONTINUOUS_SERVICE_DT,
TENURE_MONTHS,
JOB_CODE,
JOB_TITLE,
JOB_FAMILY_FUNC,
JOB_FAMILY_GRP,
JOB_FAMILY,
BUSINESS_TITLE,
EXEMPT,
FTE,
TIME_TYPE,
PAY_RATE_TYPE,
PAY_FREQUENCY,
HOURLY_RATE,
HOURLY_RATE_CURRENCY,
ANNUAL_BASE_PAY,
ANNUAL_BASE_CURRENCY,
ANNUAL_BASE_PAY_US,
ASPIRE_TARGET_PERCENTAGE,
ASPIRE_BONUS_PLAN,
ASPIRE_BONUS,
ASPIRE_BONUS_CURRENCY,
ASPIRE_BONUS_PLAN_US,
SUPERVISORY_ORG,
HIERARCHY_1,
HIERARCHY_2,
HIERARCHY_3,
HIERARCHY_4,
HIERARCHY_5,
HIERARCHY_6,
HIERARCHY_7,
HIERARCHY_8,
HIERARCHY_9,
HIERARCHY_10,
MANAGER_JOB_TITLE,
MANAGER_WORK_EMAIL,
MANAGER_GENDER,
DIRECT_REPORTS,
SPAN_OF_CONTROL,
LAST_BASE_PAY_INCREASE,
LAST_BASE_PAY_INCREASE_CURRENCY,
LAST_BASE_PAY_INCREASE_US,
LAST_BASE_PAY_INCREASE_DT,
LAST_BASE_PAY_INCREASE_PERCENT,
ONE_TIME_PAYMENT_DT,
LTIP_PLAN_AMT,
LTIP_PLAN_CURRENCY,
EMPLOYEE_TYPE,
END_EMPLOYMENT_DT,
CONTINGENT_WORKER,
CONTINGENT_WORKER_TYPE,
UNION_LOCAL_CODE,
UNION_LOCAL_NAME,
REGION,
WORK_CITY,
WORK_STATE,
WORK_POSTAL_CODE,
WORK_COUNTRY,
DEPT_ID,
COST_CENTER,
COST_CENTER_NAME,
COST_PROFIT_CENTER,
COST_PROFIT_CENTER_ID,
COST_ELEMENT_SUPERIOR,
GENDER,
AGE,
HISPANIC_LATINO,
RACE_ETHNICITY,
VETARAN,
DISBAILITY,
TERMINATION_DT,
WORK_LOCATION,
IS_VOLUNTARY_FG,
BUSINESS_PARTNER,
GENERATION,
PAY_COMPANY,
BASE_PAY_RANGE_SEGMENT,
EMAIL,
ACTIVE_STATUS,
ON_LEAVE,
JOB_DESCRIPTION,
SALARY_PLAN,
COMPENSATION_GRADE,
TERMINATION_DT_ALL,
TERMINATION_REASON,
IS_REHIRE,
FY_QUARTER,
FISCAL_YEAR,
     wtt.Effective_Dt ,
    wtt.Business_Process_Reason_Category,
    wtt.Business_Process_Reason,
    wtt.Business_Process_Type,
    case when upper(wtt.BUSINESS_PROCESS_TYPE) = 'TERMINATION' then 'Termination' when upper(wtt.BUSINESS_PROCESS_TYPE) = 'HIRE' then 'Hire' else 'Movement' end
from PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE wtt Left Join  (select *,row_number() over (partition by employee_id,snapshot_dt order by snapshot_dt) rk from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT) sh on wtt.employee_id = sh.employee_id and last_day(sh.snapshot_dt) = last_day(wtt.Effective_Dt) and sh.rk = 1--'2024-06-30'
where upper(wtt.BUSINESS_PROCESS_TYPE) IN ('TERMINATION','TRANSFER EMPLOYEE INBOUND','DEMOTE EMPLOYEE INBOUND','PROMOTE EMPLOYEE INBOUND','HIRE','MOVE WORKER (SUPERVISORY)') and wtt.effective_dt between '2024-04-01' and '2024-06-30' and sh.employee_id is not null 
;

select count(*) from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT where snapshot_dt='2024-07-10'
select count(*) from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT where snapshot_dt='2024-07-10'

create table TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT_BKP20240604_old as
select * from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT;

create table TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT_BKP20240606_old as
select * from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT;

insert into TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
select * from  TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT_BKP20240604;

create or replace TABLE TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT (
	SNAPSHOT_DT DATE,
	EMPLOYEE_ID VARCHAR(128),
	WORKDAY_ID VARCHAR(32),
	CANDIDATE_ID VARCHAR(128),
	SPE_BUSINESS_UNIT VARCHAR(50),
	SPE_DIVISION VARCHAR(100),
	SPE_SUB_DIVISION VARCHAR(100),
	SPE_DEPT VARCHAR(80),
	SPE_SUB_DEPT VARCHAR(80),
	BENEFIT_CODE VARCHAR(50),
	ORG_LEVEL VARCHAR(20),
	MANAGEMENT_LEVEL VARCHAR(30),
	HIRE_DT DATE,
	ORIGINAL_HIRE_DT DATE,
	CONTINUOUS_SERVICE_DT DATE,
	TENURE_MONTHS NUMBER(28,0),
	JOB_CODE VARCHAR(128),
	JOB_TITLE VARCHAR(120),
	JOB_FAMILY_FUNC VARCHAR(30),
	JOB_FAMILY_GRP VARCHAR(60),
	JOB_FAMILY VARCHAR(90),
	BUSINESS_TITLE VARCHAR(130),
	EXEMPT VARCHAR(10),
	FTE VARCHAR(10),
	TIME_TYPE VARCHAR(10),
	PAY_RATE_TYPE VARCHAR(20),
	PAY_FREQUENCY VARCHAR(30),
	HOURLY_RATE NUMBER(38,0),
	HOURLY_RATE_CURRENCY VARCHAR(10),
	ANNUAL_BASE_PAY NUMBER(20,2),
	ANNUAL_BASE_CURRENCY VARCHAR(10),
	ANNUAL_BASE_PAY_US NUMBER(20,2),
	ASPIRE_TARGET_PERCENTAGE VARCHAR(10),
	ASPIRE_BONUS_PLAN VARCHAR(120),
	ASPIRE_BONUS NUMBER(20,2),
	ASPIRE_BONUS_CURRENCY VARCHAR(10),
	ASPIRE_BONUS_PLAN_US NUMBER(20,2),
	SUPERVISORY_ORG VARCHAR(128),
	HIERARCHY_1 VARCHAR(16777216),
	HIERARCHY_2 VARCHAR(16777216),
	HIERARCHY_3 VARCHAR(16777216),
	HIERARCHY_4 VARCHAR(16777216),
	HIERARCHY_5 VARCHAR(16777216),
	HIERARCHY_6 VARCHAR(16777216),
	HIERARCHY_7 VARCHAR(16777216),
	HIERARCHY_8 VARCHAR(16777216),
	HIERARCHY_9 VARCHAR(16777216),
	HIERARCHY_10 VARCHAR(16777216),
	MANAGER_JOB_TITLE VARCHAR(120),
	MANAGER_WORK_EMAIL VARCHAR(128),
	MANAGER_GENDER VARCHAR(100),
	DIRECT_REPORTS VARCHAR(10),
	SPAN_OF_CONTROL VARCHAR(10),
	LAST_BASE_PAY_INCREASE NUMBER(20,2),
	LAST_BASE_PAY_INCREASE_CURRENCY VARCHAR(10),
	LAST_BASE_PAY_INCREASE_US NUMBER(20,2),
	LAST_BASE_PAY_INCREASE_DT DATE,
	LAST_BASE_PAY_INCREASE_PERCENT VARCHAR(10),
	ONE_TIME_PAYMENT_DT DATE,
	LTIP_PLAN_AMT NUMBER(20,2),
	LTIP_PLAN_CURRENCY VARCHAR(10),
	EMPLOYEE_TYPE VARCHAR(16777216),
	END_EMPLOYMENT_DT DATE,
	CONTINGENT_WORKER VARCHAR(40),
	CONTINGENT_WORKER_TYPE VARCHAR(30),
	UNION_LOCAL_CODE VARCHAR(100),
	UNION_LOCAL_NAME VARCHAR(100),
	REGION VARCHAR(20),
	WORK_CITY VARCHAR(90),
	WORK_STATE VARCHAR(40),
	WORK_POSTAL_CODE VARCHAR(20),
	WORK_COUNTRY VARCHAR(30),
	DEPT_ID VARCHAR(10),
	COST_CENTER VARCHAR(60),
	COST_CENTER_NAME VARCHAR(60),
	COST_PROFIT_CENTER VARCHAR(60),
	COST_PROFIT_CENTER_ID VARCHAR(110),
	COST_ELEMENT_SUPERIOR VARCHAR(20),
	GENDER VARCHAR(30),
	AGE VARCHAR(10),
	HISPANIC_LATINO VARCHAR(10),
	RACE_ETHNICITY VARCHAR(100),
	VETARAN VARCHAR(70),
	DISBAILITY VARCHAR(60),
	TERMINATION_DT DATE,
	WORK_LOCATION VARCHAR(200),
	IS_VOLUNTARY_FG BOOLEAN,
	BUSINESS_PARTNER VARCHAR(30),
	GENERATION VARCHAR(40),
	PAY_COMPANY VARCHAR(50),
	BASE_PAY_RANGE_SEGMENT VARCHAR(20),
	EMAIL VARCHAR(130),
	ACTIVE_STATUS BOOLEAN,
	ON_LEAVE VARCHAR(3),
	JOB_DESCRIPTION VARCHAR(16777216),
	SALARY_PLAN VARCHAR(90),
	COMPENSATION_GRADE VARCHAR(30),
	TERMINATION_DT_ALL DATE,
	TERMINATION_REASON VARCHAR(200),
	IS_REHIRE VARCHAR(10),
	FY_QUARTER VARCHAR(16777216),
	FISCAL_YEAR NUMBER(4,0),
	CORE_HC BOOLEAN,
	ALL_HC BOOLEAN
);

;
update TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
set //HIERARCHY_2 = HIERARCHY_3,
//HIERARCHY_3 = HIERARCHY_4,
//HIERARCHY_4 = HIERARCHY_5,
//HIERARCHY_5 = HIERARCHY_6,
//HIERARCHY_6 = HIERARCHY_7,
//HIERARCHY_7 = HIERARCHY_8,
//HIERARCHY_8 = HIERARCHY_9,
//HIERARCHY_9 = HIERARCHY_10,
HIERARCHY_10 = null
where HIERARCHY_9 = HIERARCHY_10 and  length(HIERARCHY_9)> 0 and snapshot_dt >= '2023-01-31';

update TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT_BKP20240604
set HIERARCHY_1 = null

where HIERARCHY_1 = 'zzzz'

HIERARCHY_10 and length(HIERARCHY_9)> 0;



select snapshot_dt,employee_id, HIERARCHY_1,
HIERARCHY_2,
HIERARCHY_3,
HIERARCHY_4,
HIERARCHY_5,
HIERARCHY_6,
HIERARCHY_7,
HIERARCHY_8,
HIERARCHY_9,
HIERARCHY_10, from  TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT_BKP20240604 where ifnull(HIERARCHY_6,'a') = ifnull(HIERARCHY_7,'b') aND length(HIERARCHY_6)> 0;

3661118
3640351
3633568
;
select employee_id, HIERARCHY_1,
HIERARCHY_2,
HIERARCHY_3,
HIERARCHY_4,
HIERARCHY_5,
HIERARCHY_6,
HIERARCHY_7,
HIERARCHY_8,
HIERARCHY_9,
HIERARCHY_10,
	 from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT w where snapshot_dt = '2022-12-31' and employee_id =  
     'f5dbf94e5f5a9ffca94379ad04e62877002f569f2999ee348a94d947834345fff4563cf4bb7eda1fb0c9934ef2d87618f58d55464fee7ab74605fd32978a54df'
     
union

select employee_id, HIERARCHY_1,
HIERARCHY_2,
HIERARCHY_3,
HIERARCHY_4,
HIERARCHY_5,
HIERARCHY_6,
HIERARCHY_7,
HIERARCHY_8,
HIERARCHY_9,
HIERARCHY_10,
	 from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT_BKP20240604 w where snapshot_dt = '2022-12-31' and employee_id =  
     'f5dbf94e5f5a9ffca94379ad04e62877002f569f2999ee348a94d947834345fff4563cf4bb7eda1fb0c9934ef2d87618f58d55464fee7ab74605fd32978a54df'
     ;

     select max(snaps) from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT;

     delete from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT where snapshot_dt = '2024-06-10';

     select max(snapshot_dt)  from 
     PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT
     //TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT w 
     where snapshot_dt >= '2024-02-29' //and contingent_worker_type is not null
     and active_status 
     //and spe_business_unit like '%Television%' 
     and candidate like '%Carolina Vega%';


  select * from  PO_HRIS_DB."Worker".WORKER_TRANSACTION_TYPE where employee_id = '4a1cc96dd41243e06bd3c315e15f08a65e716712898ea0b4f67c7130e96f619713f7c9eaa6876a4d2b02cc557baf0d5ea47acc2319f65ca0884aefdbc8194b5e'

    select  from  PO_HRIS_DB."Worker".WORKER_TRANSACTION where employee_id = '4a1cc96dd41243e06bd3c315e15f08a65e716712898ea0b4f67c7130e96f619713f7c9eaa6876a4d2b02cc557baf0d5ea47acc2319f65ca0884aefdbc8194b5e'