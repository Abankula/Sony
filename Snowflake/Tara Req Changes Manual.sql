

select *  from Job_Req_Manual where REQUISITION_ID = 'JR23-10895'

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-28'
where REQUISITION_ID = 'JR23-10895';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-05'
where REQUISITION_ID = 'JR23-10976';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-04-08'
where REQUISITION_ID = 'JR23-10984';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-01-16'--emplopyee id has date from 2008 00611135
where REQUISITION_ID = 'JR23-11041';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-05'
where REQUISITION_ID = 'JR23-11072';



Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-01'--emplopyee id has date from 2006 99002480-p internal hire
where REQUISITION_ID = 'JR23-11077';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-28'
where REQUISITION_ID = 'JR23-11089';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-03-04'
where REQUISITION_ID = 'JR23-11121';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2023-12-11'--emplopyee id has date from 2006 00722061-- internal hire
where REQUISITION_ID = 'JR23-11147';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-28' -- internal hire
where REQUISITION_ID = 'JR23-11148';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-05'
where REQUISITION_ID = 'JR23-11202';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-01-29' -- 00722206 hire date
where REQUISITION_ID = 'JR23-11206';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-09' -- 00709902  internal
where REQUISITION_ID = 'JR23-11223';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-05' -- 00718847 hire date
where REQUISITION_ID = 'JR23-11233';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-12' -- 00722219 hire date
where REQUISITION_ID = 'JR23-11238';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-02-09' -- 0072246  record na in snapshot, it is contractor
where REQUISITION_ID = 'JR23-11247';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-01-15' -- 0072202  record na in snapshot, it is contractor
where REQUISITION_ID = 'JR23-11268';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-01-29' -- 00717675 hired record missing-internal
where REQUISITION_ID = 'JR23-11269';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-03-05' -- 00722241 hired record missing 
where REQUISITION_ID = 'JR23-11274';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-03-04' -- 00722241 hired record missing 
where REQUISITION_ID = 'JR23-11289';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-01-29' -- 00722248 hired record missing 
where REQUISITION_ID = 'JR23-11312';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-03-25' -- 00722207 hired record missing 
where REQUISITION_ID = 'JR23-11328';


Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-01-29' -- 00719765 hired record missing 
where REQUISITION_ID = 'JR24-10003';

Update Job_Req_Manual 
set requisition_status = 'Filled',
CLOSE_DT = null,
FILL_DT = '2024-03-04' -- 0072205 hired record missing 
where REQUISITION_ID = 'JR24-10013';


select hire_dt,* from PO_HRIS_DB."Worker".PO_Worker_Snapshot where snapshot_dt = '2024-04-18' and employee_id = '00709902' limit 1;

select job_application, job_requisition,*
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where upper(job_requisition) like '%JR23-11233%' and
job_application like '%Annie Yuill%';


create or replace table Job_Req_Manual as
select * from
(
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
null as "Count of Active Candidates",
Worker_Type ,
Benefit_Group,
ORG_LEVEL,
Worker_Sub_Type,
'2' as SOURCE,
'New_Workday' as System,
from PO_HRIS_DB."Application".PO_WD_REQUISITION where worker_type = 'Employee'and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)') and upper(JOB_FAMILY_GROUP) <> 'UNION GROUP' and REQUISITION_STATUS = 'Closed'
union all
select 
REQ_ID,
REQ_STATUS,
REQ_OPEN_DT,
OFFER_DT,
READY_TO_HIRE_DT,
FILL_DT,
REQ_CLOSE_DT,
REQ_FREEZE_DT,
REQ_UNFREEZE_DT,
job_requisition,
Null as region,
Null as City,
REQ_COUNTRY,
Null as Business_init,
REQ_DIVISION,
REQ_SUB_DIVISION,
REQ_HIRING_MANAGER,
Null as Business_Partner,
REQ_RECRUITER,
null as "Count of Active Candidates",
REQ_EMPLOYEE_TYPE,
REQ_BENIFIT_CODE,
REQ_ORG_LEVEL,
Worker_SubType,
'1' ,
'Legacy_Workday'
from 
(select 
distinct
REQ_ID,
job_requisition,
REQ_STATUS,
REQ_OPEN_DT,
REQ_CLOSE_DT,
REQ_FREEZE_DT,
REQ_UNFREEZE_DT,
REQ_TARGET_DT,
READY_TO_HIRE_DT,
OFFER_DT,
TARGET_HIRE_DT,
HIRE_DT,
FILL_DT,
REQ_HIRING_MANAGER,
REQ_COUNTRY,
REQ_RECRUITER,
//REQ_RECRUITER_EMP_ID,
REQ_JOB_PROFILE,
REQ_LOCATION,
REQ_ORG_LEVEL,
REQ_DIVISION,
REQ_SUB_DIVISION,
REQ_DEPARTMENT,
REQ_SUB_DEPARTMENT,
REQ_EMPLOYEE_TYPE,
Worker_SubType,
REQ_BENIFIT_CODE,
REQ_COMP_GRADE,
REQ_COMP_GRADE_MIN,
REQ_COMP_GRADE_MID,
REQ_COMP_GRADE_MAX,
REQ_PAY_COMPANY,
REQ_PAY_TRANSPARENCY_RANGE,
row_number() over(partition by REQ_ID order by ifnull(hire_dt, '1900-01-01') desc) rn
from PO_HRIS_DB."Application".PO_WD_CANDIDATE 
where SOURCE_SYSTEM like '%Legacy%' and REQ_STATUS = 'Open'
)
a where rn =1)b where REQUISITION_ID IN (

select distinct REQUISITION_ID from 
(select count(*), REQUISITION_ID from
 
(
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
null as "Count of Active Candidates",
Worker_Type ,
Benefit_Group,
ORG_LEVEL,
Worker_Sub_Type,
'2' as SOURCE,
'New_Workday' as System,
from PO_HRIS_DB."Application".PO_WD_REQUISITION where worker_type = 'Employee'and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)') and upper(JOB_FAMILY_GROUP) <> 'UNION GROUP' and REQUISITION_STATUS = 'Closed'
union all
select 
REQ_ID,
REQ_STATUS,
REQ_OPEN_DT,
OFFER_DT,
READY_TO_HIRE_DT,
FILL_DT,
REQ_CLOSE_DT,
REQ_FREEZE_DT,
REQ_UNFREEZE_DT,
job_requisition,
Null as region,
Null as City,
REQ_COUNTRY,
Null as Business_init,
REQ_DIVISION,
REQ_SUB_DIVISION,
REQ_HIRING_MANAGER,
Null as Business_Partner,
REQ_RECRUITER,
null as "Count of Active Candidates",
REQ_EMPLOYEE_TYPE,
REQ_BENIFIT_CODE,
REQ_ORG_LEVEL,
Worker_SubType,
'1' ,
'Legacy_Workday'
from 
(select 
distinct
REQ_ID,
job_requisition,
REQ_STATUS,
REQ_OPEN_DT,
REQ_CLOSE_DT,
REQ_FREEZE_DT,
REQ_UNFREEZE_DT,
REQ_TARGET_DT,
READY_TO_HIRE_DT,
OFFER_DT,
TARGET_HIRE_DT,
HIRE_DT,
FILL_DT,
REQ_HIRING_MANAGER,
REQ_COUNTRY,
REQ_RECRUITER,
//REQ_RECRUITER_EMP_ID,
REQ_JOB_PROFILE,
REQ_LOCATION,
REQ_ORG_LEVEL,
REQ_DIVISION,
REQ_SUB_DIVISION,
REQ_DEPARTMENT,
REQ_SUB_DEPARTMENT,
REQ_EMPLOYEE_TYPE,
Worker_SubType,
REQ_BENIFIT_CODE,
REQ_COMP_GRADE,
REQ_COMP_GRADE_MIN,
REQ_COMP_GRADE_MID,
REQ_COMP_GRADE_MAX,
REQ_PAY_COMPANY,
REQ_PAY_TRANSPARENCY_RANGE,
row_number() over(partition by REQ_ID order by ifnull(hire_dt, '1900-01-01') desc) rn
from PO_HRIS_DB."Application".PO_WD_CANDIDATE 
where SOURCE_SYSTEM like '%Legacy%' and REQ_STATUS = 'Open'
)
a where rn =1)b group by 2 having count(*) > 1)); 


--where REQUISITION_ID = 'JR23-11228';

Filled in new workday- New workday
Open and Open - New Workday
Closed and Open - New Workday
Frozen and Closed - New workday
Open and Closed 


)b group by 1 having count(*) > 1;;--where REQUISITION_ID = 'JR23-11257'; --where rk1 = 1 and system like 'New%';

JR23-11257
// group by 2,3 having count(*) > 1;

select * from PO_HRIS_DB."Application".PO_WD_REQUISITION where requisition_id IN 
(select distinct REQ_ID
from PO_HRIS_DB."Application".PO_WD_CANDIDATE 
where SOURCE_SYSTEM like '%Legacy%' and application_dt = '2024-01-14' and REQ_STATUS = 'Open') and requisition_status = 'Closed'