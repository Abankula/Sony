

/*
Filled in new workday- New workday
Open and Open - New Workday
Closed and Open - New Workday
Frozen and Closed - New workday
Open and Closed - 72 reqs send to tara for double check and need manually load into separate table 
*/


Create or replace table PO_WD_REQUISITION_LEGACY
(Reference_ID Varchar,
Requisition_Status Varchar,
Number_of_Openings_Available Varchar,
Open_Date Date,
Offer_Date Date,
Ready_for_Hire_Date Date,
Fill_Date Date,
Close_Date Date,
Freeze_Date Date,
Unfreeze_Date Date,
Job_Requisition Varchar,
Region Varchar,
City Varchar,
Country Varchar,
Business_Unit Varchar,
Division Varchar,
Sub_Division Varchar,
Hiring_Manager Varchar,
Primary_Business_Partner Varchar,
Recruiter Varchar,
Count_of_Active_Candidates Varchar,
Employee_Type Varchar,
Benefit_Code Varchar,
Org_Level Varchar,
Worker_Employee_Type Varchar);

Create or replace table TABLEAU."candidate".Job_Requisition as
select 
REQUISITION_ID,
REQUISITION_STATUS,
OPEN_DT,
OFFER_DT,
READY_TO_HIRE_DT,
FILL_DT,
CLOSE_DT,
FREEZE_DT,
UNFREEZE_DT,
JOB_REQUISITION,
Region,
City,
REQUISITION_COUNTRY,
BUSINESS_UNIT,
DIVISION,
SUB_DIVISION,
HIRING_MANAGER,
BUSINESS_PARTNER,
RECRUITER,
"Count of Active Candidates",
Worker_Type ,
Benefit_Group,
ORG_LEVEL,
Worker_Sub_Type,
System
from(

select *,row_number() over (partition by REQUISITION_ID order by source) rn1  from(
select 
wr.REQUISITION_ID,
wr.REQUISITION_STATUS,
ifnull(wrl.OPEN_DATE,wr.OPEN_DT) as OPEN_DT,
wr.OFFER_DT,
wr.READY_TO_HIRE_DT,
wr.FILL_DT,
wr.CLOSE_DT,
wr.FREEZE_DT,
wr.UNFREEZE_DT,
wr.JOB_REQUISITION,
wr.Region,
wr.City,
wr.REQUISITION_COUNTRY,
wr.BUSINESS_UNIT,
wr.DIVISION,
wr.SUB_DIVISION,
wr.HIRING_MANAGER,
wr.BUSINESS_PARTNER,
wr.RECRUITER,
null as "Count of Active Candidates",
wr.Worker_Type ,
wr.Benefit_Group,
wr.ORG_LEVEL,
wr.Worker_Sub_Type,
'1' as SOURCE,
'New_Workday' as System,
from 
PO_HRIS_DB."Application".PO_WD_REQUISITION wr Left join PO_HRIS_DB."Application".PO_WD_REQUISITION_Legacy wrl on upper(Reference_ID) = upper(REQUISITION_ID)
where upper(worker_type) = 'EMPLOYEE'
and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)')
and upper(JOB_FAMILY_GROUP) <> 'UNION GROUP'  
union all
Select
Reference_ID,
Requisition_Status,
Open_Date,
Offer_Date,
Ready_for_Hire_Date,
Fill_Date,
Close_Date,
Freeze_Date,
Unfreeze_Date,
Job_Requisition,
Region,
City,
Country,
Business_Unit,
Division,
Sub_Division,
Hiring_Manager,
Primary_Business_Partner,
Recruiter,
Count_of_Active_Candidates,
Employee_Type,
Benefit_Code,
Org_Level,
Worker_Employee_Type,
'2',
'Legacy'
from PO_HRIS_DB."Application".PO_WD_REQUISITION_Legacy Where OPEN_DATE >= '2016-01-01' //and benefit_code NOT IN () 

)b 
)where rn1 =  1 and requisition_id NOT IN (SELECT DISTINCT requisition_id from TABLEAU."candidate".JOB_REQ_MANUAL)
union all
SELECT * from TABLEAU."candidate".JOB_REQ_MANUAL;

select *
from 
PO_HRIS_DB."Application".PO_WD_REQUISITION wr

select * from PO_WD_REQUISITION_LEGACY where employee_type = 'All Other' and city = 'Culver City';

select * from
(
select * from (select 
REQUISITION_ID as "Reference ID",
OPEN_DT,
READY_TO_HIRE_DT,
FILL_DT,
CLOSE_DT,
FREEZE_DT,
UNFREEZE_DT,
Region "HRIS - Geographic Region",
BUSINESS_UNIT "Business Unit",
DIVISION "Division",
SUB_DIVISION "Sub Division",
HIRING_MANAGER,
BUSINESS_PARTNER "Primary Business Partner",
RECRUITER as "Recruiter(s)",
Worker_Type as "Employee Type" ,
Benefit_Group as "Benefit Code",
case when  REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') is null and REQUISITION_COUNTRY = 'United States of America' then 'USANULL'
when  REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') is null and REQUISITION_COUNTRY <> 'United States of America' then 'NONUSA' 
else REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') end
as Derived_Benefit_Code, 
ORG_LEVEL "Org Level",
Worker_Sub_Type as "Worker Employee Type",
City,
JOB_REQUISITION as "Job Requisition",
REQUISITION_COUNTRY as "Country"
from TABLEAU."candidate".JOB_REQUISITION)a where REGEXP_SUBSTR(Derived_Benefit_Code, '^[[:alnum:]]+') IN ('A1','C1','N4','N6','NONUSA','USANULL','B4','B3','VA1') //and upper(worker_type) not like '%INTERN%'
)t
unpivot ("MONTH DT" For "Requisition Status" IN (OPEN_DT,READY_TO_HIRE_DT,FILL_DT,CLOSE_DT,FREEZE_DT,UNFREEZE_DT))


select 
REQUISITION_ID as "Reference ID",
OPEN_DT "Open Date",
ifnull(READY_TO_HIRE_DT,FILL_DT) "Ready For Hire Date",
FILL_DT  "Fill Date",
CLOSE_DT "Close Date",
FREEZE_DT "Freeze Date",
UNFREEZE_DT "Unfreeze Date",
OFFER_DT as "Offer Date",
Region "HRIS - Geographic Region",
BUSINESS_UNIT "Business Unit",
DIVISION "Division",
SUB_DIVISION "Sub Division",
HIRING_MANAGER "Hiring Manager",
BUSINESS_PARTNER "Primary Business Partner",
RECRUITER as "Recruiter(s)",
Worker_Type "Employee Type",
Benefit_Group as "Benefit Code",
case when  REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') is null and REQUISITION_COUNTRY = 'United States of America' then 'USANULL'
when  REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') is null and REQUISITION_COUNTRY <> 'United States of America' then 'NONUSA' 
else REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') end
as Derived_Benefit_Code, 
ORG_LEVEL "Org Level",
Worker_Sub_Type as "Worker Employee Type",
City,
REQUISITION_COUNTRY as Country,
JOB_REQUISITION as "Job Requisition",
REQUISITION_STATUS as "Job Requisition Status"
select case when  REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') is null and REQUISITION_COUNTRY = 'United States of America' then 'USANULL'
when  REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') is null and REQUISITION_COUNTRY <> 'United States of America' then 'NONUSA' 
else REGEXP_SUBSTR(Benefit_Group, '^[[:alnum:]]+') end
as Derived_Benefit_Code,*
from TABLEAU."candidate".JOB_REQUISITION where REGEXP_SUBSTR(Derived_Benefit_Code, '^[[:alnum:]]+') IN ('A1','C1','N4','N6','NONUSA','USANULL','B4','B3','VA1')// and ready_to_hire_dt is null and fill_dt is not null;



TRANSPOSE ((category1, category2, category3) AS (key, value))

select * from TABLEAU."candidate".JOB_REQUISITION where ;


select 
*
from TABLEAU."candidate".JOB_REQUISITION where requisition_id = 'JR23-10743'

open_dt between '2023-12-01' and '2023-12-31'

upper(worker_type)  like '%INTERN%' requisition_id = 'JR24-10082'

benefit_group is null //and system = 'Legacy'

//and open_dt between '2023-12-01' and '2023-12-31'
and requisition_country <> 'United States of America' group by 2 ;


select max(snapshot_dt) from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT limit 1;
select 
*
from 
PO_HRIS_DB."Application".PO_WD_REQUISITION wr //Left join PO_HRIS_DB."Application".PO_WD_REQUISITION_Legacy wrl on upper(Reference_ID) = upper(REQUISITION_ID)
where upper(worker_type) = 'EMPLOYEE'
and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)')
and upper(JOB_FAMILY_GROUP) <> 'UNION GROUP'  and open_dt >= '2024-04-01'

ready_to_hire_dt is null and fill_dt is not null and requisition_id not in ( SELECT distinct requisition_id from TABLEAU."candidate".JOB_REQ_MANUAL)
;

select * from
TABLEAU."candidate".Job_Requisition where ready_to_hire_dt is null and fill_dt is not null;