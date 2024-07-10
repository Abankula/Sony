

select * from PO_HRIS_DB."Application".PO_WD_REQUISITION where requisition_id = 'JR100765';

select 
where worker_type = 'Employee'and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)') and upper(JOB_FAMILY_GROUP) <> 'UNION GROUP';

select ws.employee_id,ws.contingent_worker,ws.contingent_worker_type,ws.*from PO_HRIS_DB."Worker".PO_Worker_Snapshot ws
left join (select * from PO_HRIS_DB."Worker".PO_Worker_Snapshot where snapshot_dt = '2023-10-31' )es on es.employee_id = ws.employee_id
where ws.snapshot_dt = '2024-04-14' and es.employee_id  is not null;

select * from PO_HRIS_DB."Worker".PO_Worker_Snapshot where snapshot_dt >= '2023-10-31' 
and employee_id = '4e3b0eca5542b7d4802290c04c7c0f96c1b56313e7e0e74aa17dd4948eb6f7cb3b41fce762b0df082416bfeba1a84e06ae60fba6c0e1b27b773aebd673896c4c'

contingent_worker_type is not null
  group by 1,2,3 having count(distinct benefit_code) > 1;

  select job_code, benefit_code,supervisory_org,work_country,employee_type,work_city,work_state,dept,job_family,job_family_func,job_family_grp,contingent_worker,contingent_worker_type,* 
from PO_HRIS_DB."Worker".PO_Worker_Snapshot 
where snapshot_dt = '2024-04-14' 
and employee_type = 'Limited Term' 
and dept_id in ('8947','8456','1560','8441','8002','2967')
and work_country ='United States of America' and ifnull(job_family_grp,'abc') <> 'Union Group';

select dept_id,job_code, benefit_code,supervisory_org,work_country,employee_type,work_city,work_state,dept,job_family,job_family_func,job_family_grp,contingent_worker,contingent_worker_type,* from PO_HRIS_DB."Worker".PO_Worker_Snapshot where snapshot_dt = '2024-04-14' //and employee_type = 'Limited Term'
and benefit_code like '%B3 Show Hire US%' ;and job_code = 'D-LGT-P3N-03' and hire_dt > '2021-01-01';

select job_code, benefit_code,supervisory_org,work_country,employee_type,work_city,work_state,dept,job_family,job_family_func,job_family_grp,contingent_worker,contingent_worker_type,* from PO_HRIS_DB."Worker".PO_Worker_Snapshot where snapshot_dt = '2024-04-14' //and employee_type = 'Limited Term'

//and job_code like 'D-%' 
and employee_type = 'Limited Term' 
and work_country ='United States of America'
and job_family_grp = 'Digital Entertainment Group'
and dept_id in ( '8244',
'8277',
'8279',
'8280',
'8366',
'8367')


select job_code, benefit_code,supervisory_org,work_country,employee_type,work_city,work_state,dept,job_family,job_family_func,job_family_grp,contingent_worker,contingent_worker_type,* 
from PO_HRIS_DB."Worker".PO_Worker_Snapshot 
where snapshot_dt = '2024-04-14' 
and employee_type = 'Limited Term' 
and dept_id in ('8947','8456','1560',
'8441',
'8002',
'2967'
)
and work_country ='United States of America' and ifnull(job_family_grp,'abc') <> 'Union Group'

dept_id in ('8947','8456',
'8441',
'8002',
'2967'
)

select distinct req_benifit_code,req_id,req_employee_type,req_job_profile,job_ from PO_HRIS_DB."Application".PO_WD_CANDIDATE c
right join  
(select distinct requisition_id from
(
select worker_type,worker_sub_type,JOB_FAMILY_GROUP,job_family,requisition_country,benefit_group,job_code,department,
case  
    when worker_type = 'Employee'and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)') and upper(ifnull(JOB_FAMILY_GROUP,job_family)) <> 'UNION GROUP' then 
    'A1' 
    when worker_type = 'Employee'and upper(worker_sub_type) like '%INTERN%' and upper(JOB_FAMILY) = 'INTERN' then 'B6' 
    when worker_type = 'Employee'and upper(worker_sub_type) like '%INTERN%' and upper(JOB_FAMILY) <> 'INTERN' then 'B5' 
    //when worker_type = 'Employee' and requisition_country = 'United States of America' then 'Country'
   
else null 

end as Dervied_Benefit_Group,*

 from PO_HRIS_DB."Application".PO_WD_REQUISITION where department like '%Term%' //and requisition_id = 'JR23-11032'
  Dervied_Benefit_Group is null
))a on c.req_id = a.requisition_id;

JR23-11032
JR23-10674

select * from PO_HRIS_DB."Application".PO_WD_REQUISITION where worker_type = 'Employee'

select worker_type,worker_sub_type,JOB_FAMILY_GROUP,job_family,requisition_country,benefit_group,job_code,
case  
    when worker_type = 'Employee'and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)') and upper(ifnull(JOB_FAMILY_GROUP,job_family)) <> 'UNION GROUP' then 
    'A1' 
    when worker_type = 'Employee'and upper(worker_sub_type) like '%INTERN%' and upper(JOB_FAMILY) = 'INTERN' then 'B6' 
    when worker_type = 'Employee'and upper(worker_sub_type) like '%INTERN%' and upper(JOB_FAMILY) <> 'INTERN' then 'B5' 
    //when worker_type = 'Employee' and requisition_country = 'United States of America' then 'Country'
   
else null 

end as Dervied_Benefit_Group,*

 from PO_HRIS_DB."Application".PO_WD_REQUISITION where job_code in (
select distinct job_code from PO_HRIS_DB."Worker".PO_Worker_Snapshot where snapshot_dt = '2024-04-14' //,and employee_type = 'Limited Term'

//and benefit_code = 'A3 Term Deal US' 
)
//where worker_type = 'Employee'and upper(worker_sub_type) IN ('REGULAR', 'LIMITED TERM(FIXED TERM)') and upper(JOB_FAMILY_GROUP) <> 'UNION GROUP';



//and requisition_id = 'JR100172' ;-- benefit-group


Aldiar has provided benefit code to Ray, B3,BA1, N6 with term deals;

select * from PO_STAGE_DB."Worker".PO_WD_REQUISITION_STG where fill_dt is not null and ready_to_hire_dt is null;


create or replace TABLE PO_STAGE_DB."Worker".PO_WD_REQUISITION_STG (
	REQUISITION_ID VARCHAR(20),
	JOB_REQUISITION VARCHAR(200),
	REQUISITION_STATUS VARCHAR(30),
	CREATED_MOMENT VARCHAR(30),
	OPEN_DT VARCHAR(20) ,
	FILL_DT VARCHAR(20) ,
	HIRE_DT VARCHAR(20) ,
	CLOSE_DT VARCHAR(20) ,
	FREEZE_DT VARCHAR(20) ,
	UNFREEZE_DT VARCHAR(20) ,
	READY_TO_HIRE_DT VARCHAR(20) ,
	OFFER_DT VARCHAR(20) ,
	TARGET_REQ_DT VARCHAR(20) ,
	HIRING_MANAGER VARCHAR(200),
    Hiring_Manager_ID VARCHAR(20) ,
    Hiring_Manager_ID_Hash VARCHAR(128),
    Hiring_Manager_Email VARCHAR(200),
    REQUISITION_COUNTRY VARCHAR(100),
	RECRUITER VARCHAR(200),
	RECRUITER_EMP_ID VARCHAR(20),
    RECRUITER_EMP_Hash VARCHAR(128),
    Job_Family VARCHAR(200),
    Job_Family_Group VARCHAR(200),
    Job_Profile VARCHAR(200),
    Job_Code VARCHAR(200),
    Worker_Sub_Type VARCHAR(200),
    Worker_Type VARCHAR(200),
    BUSINESS_PARTNER VARCHAR(128),
	REQ_LOCATION VARCHAR(100),
	ORG_LEVEL VARCHAR(100),
    REGION VARCHAR(100),
    CITY VARCHAR(200),
    BUSINESS_UNIT VARCHAR(50),
	DIVISION VARCHAR(100),
	SUB_DIVISION VARCHAR(100),
	DEPARTMENT VARCHAR(100),
	COMP_GRADE VARCHAR(100),
	COMP_GRADE_MIN VARCHAR(10),
	COMP_GRADE_MID VARCHAR(10),
	COMP_GRADE_MAX VARCHAR(10),
	PAY_COMPANY VARCHAR(200),
    SAP_COMPANY VARCHAR(100),
	//COMP_RANGE VARCHAR(16777216),
    benefit_code varchar(40),
	SOURCE_FILENAME VARCHAR(100)
);

create or replace TABLE PO_HRIS_DB."Application".PO_WD_REQUISITION (
	REQUISITION_ID VARCHAR(20),
JOB_REQUISITION VARCHAR(200),
REQUISITION_STATUS VARCHAR(30),
CREATED_MOMENT TIMESTAMP_NTZ(9),
OPEN_DT DATE ,
FILL_DT DATE,
HIRE_DT DATE,
CLOSE_DT DATE,
FREEZE_DT DATE,
UNFREEZE_DT DATE,
READY_TO_HIRE_DT DATE,
OFFER_DT DATE,
TARGET_REQ_DT DATE,
HIRING_MANAGER VARCHAR(100),
    Hiring_Manager_ID Varchar(20),
    Hiring_Manager_ID_Hash VARCHAR(128),
    Hiring_Manager_Email VARCHAR(100),
    REQUISITION_COUNTRY VARCHAR(100),
RECRUITER VARCHAR(1000),
RECRUITER_EMP_ID VARCHAR(128),
    RECRUITER_EMP_Hash VARCHAR(128),
    Job_Family VARCHAR(200),
    Job_Family_Group VARCHAR(200),
JOB_PROFILE VARCHAR(100),
    Job_Code VARCHAR(200),
    benefit_group varchar(40),
    Worker_Sub_Type VARCHAR(200),
    Worker_Type VARCHAR(200),
BUSINESS_PARTNER VARCHAR(128),
REQ_LOCATION VARCHAR(100),
ORG_LEVEL VARCHAR(100),
  REGION VARCHAR(100),
    CITY VARCHAR(200),
    BUSINESS_UNIT VARCHAR(50),
DIVISION VARCHAR(100),
SUB_DIVISION VARCHAR(100),
DEPARTMENT VARCHAR(100),
COMP_GRADE VARCHAR(100),
COMP_GRADE_MIN VARCHAR(10),
COMP_GRADE_MID VARCHAR(10),
COMP_GRADE_MAX VARCHAR(10),
PAY_COMPANY VARCHAR(200),
    SAP_COMPANY VARCHAR(100),

	SOURCE_FILENAME VARCHAR(100),
	CREATED_DATETIME TIMESTAMP_NTZ(9) NOT NULL,
	MODIFIED_DATETIME TIMESTAMP_NTZ(9) NOT NULL,
	CREATED_BY VARCHAR(100) NOT NULL,
	MODIFIED_BY VARCHAR(100) NOT NULL,
	BATCH_ID NUMBER(38,0) NOT NULL
);
SELECT SYSTEM$BEHAVIOR_CHANGE_BUNDLE_STATUS('2024_02');
SELECT SYSTEM$SHOW_ACTIVE_BEHAVIOR_CHANGE_BUNDLES();


/*Task for Newhire*/
create or replace task PO_HRIS_DB."Application".t_po_wd_requisition
Warehouse = po_wh
SCHEDULE = 'USING CRON 15 09 * * * America/Chicago'
as 
Call sp_wd_requisition_load((to_char(current_date -1,'YYYYMMDD') )::int)
;
truncate table PO_HRIS_DB."Application".PO_WD_REQUISITION;
copy into PO_STAGE_DB."Worker".PO_WD_REQUISITION_STG
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
//pattern = '.*WD_Job_Applications_Recon_*.*_.*csv'
pattern = '.*WD_Job_Req.*_20240612.*csv' 
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;


CREATE OR REPLACE PROCEDURE sp_wd_job_req_load(Filedate int)                                                                                                                                                     RETURNS VARCHAR
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
max_date_stg date;
max_date date;
batch_id int;

begin

record_date := current_date();
created_datetime := current_timestamp(); 
modified_datetime := current_timestamp(); 
created_by := current_user();
modified_by :=  current_user();
select ((to_char(current_date -1,'YYYYMMDD') )::int) into batch_id;


truncate table PO_STAGE_DB."Worker".PO_WD_REQUISITION_STG;

let ins_statement:= 
'
INSERT INTO PO_STAGE_DB."Worker".PO_WD_REQUISITION_STG
(


Insert into PO_HRIS_DB."Application".PO_WD_REQUISITION
(
REQUISITION_ID,
JOB_REQUISITION,
REQUISITION_STATUS,
CREATED_MOMENT,
OPEN_DT,
FILL_DT,
HIRE_DT,
CLOSE_DT,
FREEZE_DT,
UNFREEZE_DT,
READY_TO_HIRE_DT,
OFFER_DT,
TARGET_REQ_DT,
HIRING_MANAGER,
Hiring_Manager_ID,
Hiring_Manager_ID_Hash,
Hiring_Manager_Email,
REQUISITION_COUNTRY,
RECRUITER,
RECRUITER_EMP_ID,
RECRUITER_EMP_Hash,
JOB_PROFILE,
BUSINESS_PARTNER,
REQ_LOCATION,
ORG_LEVEL,
BUSINESS_UNIT,
DIVISION,
SUB_DIVISION,
DEPARTMENT,
COMP_GRADE,
COMP_GRADE_MIN,
COMP_GRADE_MID,
COMP_GRADE_MAX,
PAY_COMPANY,
SAP_COMPANY,
Worker_Sub_Type ,
Worker_Type ,
Job_Family,
Job_Family_Group,
Job_Code,
Region,
City,
Benefit_Group,
SOURCE_FILENAME,
CREATED_DATETIME,
MODIFIED_DATETIME,
CREATED_BY,
MODIFIED_BY,
BATCH_ID
)
select 
REQUISITION_ID,
REGEXP_SUBSTR(JOB_REQUISITION, '([A-Za-z,. ]+) \()') ,
REQUISITION_STATUS,
CREATED_MOMENT,
OPEN_DT,
FILL_DT,
HIRE_DT,
CLOSE_DT,
FREEZE_DT,
UNFREEZE_DT,
READY_TO_HIRE_DT,
OFFER_DT,
TARGET_REQ_DT,
HIRING_MANAGER,
Hiring_Manager_ID,
Hiring_Manager_ID_Hash,
Hiring_Manager_Email,
REQUISITION_COUNTRY,
RECRUITER,
RECRUITER_EMP_ID,
RECRUITER_EMP_Hash,
JOB_PROFILE,
BUSINESS_PARTNER,
REQ_LOCATION,
ORG_LEVEL,
BUSINESS_UNIT,
DIVISION,
SUB_DIVISION,
DEPARTMENT,
COMP_GRADE,
COMP_GRADE_MIN,
COMP_GRADE_MID,
COMP_GRADE_MAX,
PAY_COMPANY,
SAP_COMPANY,
Worker_Sub_Type ,
Worker_Type ,
Job_Family,
Job_Family_Group,
Job_Code,
Region,
City,
Benefit_code,
SOURCE_FILENAME,
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP,
CURRENT_USER,
CURRENT_USER,
20240612
from PO_STAGE_DB."Worker".PO_WD_REQUISITION_STG ;

























select active_status,snapshot_dt,count(*) from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT group by 1,2  ;
limit 10



select active_status,snapshot_dt,count(*) from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT where snapshot_dt >= '2021-01-01' group by 1,2  ;


select count(*),New_employee_type,Old_employee_type from(
select ws.employee_type as new_employee_type,ws1.employee_type as old_employee_type,ws1.division,ws.division,ws1.employee_id,   ws.*

from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT ws 
left join PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT ws1 on ws.employee_id = ws1.employee_id and ws1.snapshot_dt = '2022-02-28'  
where ws.snapshot_dt = '2022-03-31' //and ws.employee_type <> ws1.employee_type and ws1.employee_type is not null 
//and ws.active_status 
and ws1.employee_id is null
)A group by 2,3
select active_status,snapshot_dt,count(*) from PO_STAGE_DB."Worker".PO_WORKER_SNAPSHOT_20231203 where snapshot_dt >= '2021-01-01' group by 1,2  ; limit 10;

group by 1,2  ;