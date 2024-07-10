--History manual changes
Update PO_HRIS_DB."Application".PO_WD_REQUISITION
set Requisition_Status = 'Filled'
where Requisition_Status like '%Fill Date%';

Update "PO_HRIS_DB"."Application".PO_WD_CANDIDATE
set Req_Status = 'Filled'
where Req_Status like '%Fill Date%';


    Update PO_HRIS_DB."Application".PO_WD_REQUISITION r
    set r.RECRUITER = b.RECRUITER
    from (select distinct* from PO_STAGE_DB."Worker".JOB_REQ_HASH)b
    where r.RECRUITER is null;

    
    Update PO_HRIS_DB."Application".PO_WD_REQUISITION r
    set r.BUSINESS_PARTNER = b.BUSINESS_PARTNER
    from (select distinct* from PO_STAGE_DB."Worker".JOB_REQ_HASH)b
    //where r.RECRUITER is null;

    
select count(distinct name),name_hash from 
(
select pr.requisition_id,j.job_id, j.recruiter as name,pr.recruiter as name_hash,pr.recruiter_emp_id from PO_HRIS_DB."Application".PO_WD_REQUISITION pr left join (select distinct* from PO_STAGE_DB."Worker".JOB_REQ_HASH) j on j.job_id = pr.REQUISITION_ID
) a group by 2 having count(distinct name) > 1;

select pr.requisition_id,j.job_id, j.recruiter as name,pr.recruiter as name_hash,pr.recruiter_emp_id from PO_HRIS_DB."Application".PO_WD_REQUISITION pr left join (select distinct* from PO_STAGE_DB."Worker".JOB_REQ_HASH) j on j.job_id = pr.REQUISITION_ID

create temp table recruiter_hash as
select recruiter,requisition_id from 
(
select distinct recruiter,requisition_id, row_number() over(partition by recruiter order by requisition_id asc ) rnk from PO_HRIS_DB."Application".PO_WD_REQUISITION 
)a where rnk = 1

where pr.recruiter = 'a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26';

select rh.*,j.recruiter from recruiter_hash rh 
left join (select distinct job_id,recruiter  from PO_STAGE_DB."Worker".JOB_REQ_HASH) j on upper(rh.requisition_id) = upper(j.job_id)



Select *from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG group by 2 having count(distinct recruiter) > 1
--backups
create table PO_STAGE_DB."Worker".PO_WD_REQUISITION_bkp20240315 as --unhash recruiter
select * from PO_HRIS_DB."Application".PO_WD_REQUISITION;

create table PO_STAGE_DB."Worker".PO_WD_CANDIDATE_OLD as; --unhash recruiter


select distinct req_benifit_code,source,source_category,* from PO_HRIS_DB."Application".PO_WD_CANDIDATE// where source

where req_id = 'JR100001' limit 1 ;


create table PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG_CURRENT as --unhash recruiter;
select * delete from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where upper(source_system) like '%CURRENT%';--69726

alter table "PO_HRIS_DB"."Application".PO_WD_REQUISITION
Add Recruiter_Name Varchar(1000);

alter table "PO_HRIS_DB"."Application".PO_WD_REQUISITION
Add Business_Partner Varchar(1000);

--Validations
select count(*),requisition_id from "PO_HRIS_DB"."Application".PO_WD_REQUISITION group by 2 having count(*) > 1;-- no data


Select max(application_dt) from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG limit 10;

select distinct Req_id, req_benifit_code from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE;



Select max(application_dt::date) from   "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG;--680026

Select count(*),application_id from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE group by 2 having count(*) > 1 ;


Select count(distinct s.candidate_id) as from_stg, a.to_final from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG s inner join --385557
(Select count(distinct candidate_id) as to_final from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE) a group by 2;




select * from "PO_HRIS_DB"."Application".PO_WD_REQUISITION where requisition_id = 'JR23-10976';-- matches with file

select * from "PO_HRIS_DB"."Application".PO_WD_REQUISITION where requisition_id IN ('JR20-10284',
'JR22-10109',
'JR22-10572',
'JR22-10858','JR21-11046');-- matches with file


select * from "PO_HRIS_DB"."Application".PO_WD_REQUISITION where requisition_id in ( 'JR23-10002', 'JR22-11507')
where requisition_id IN ('JR20-10104',
'JR22-11709');-- Closed status matches

select *  from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where upper(req_id) = 'JR100765'


,JR22-11507- filled in lgeacy and closed in new
where created_datetime::date = '2024-03-12';



JR24-10123;
delete from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where application_dt::date > '2024-01-15' ;
select source_filename, min(application_dt::date),max(application_dt::date) from PO_HRIS_DB."Application".PO_WD_CANDIDATE group by 1;

delete from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where application_dt::date >= '2024-03-01'

where requisition_status = 'Frozen'-- frozen validated.

select job_application,* from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where job_application like '%Simonds%' limit 10

"PO_HRIS_DB"."Application".PO_WD_CANDIDATE where source_filename = 'WD_Job_Applications_202401_202403_20240303_hashed.csv';


select min(application_dt) from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where application_dt >= '2024-01-16'

requisition_id = 'JR100087';-- Unable to find the hired candidate

select * from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where req_id = 'JR23-10976';-- Unable to find the req 


select * from "PO_HRIS_DB"."Application".PO_WD_REQUISITION where RECRUITER IS NULL

hire_dt <> fill_dt is not null;--Hire date and fill date are different

/*candidate duplication*/

select count(*),application_id from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE group by 2 having count(*) > 1 limit 10;

select * from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where candidate_id = 
'6d5a1418ffe42e88bba5d6895216e1405e944a52dfbd57581f8d81ef734ba4f6e2ba0e0c779e3576280b51814562796a46166d587321b6f38c75c9b1022ea369'

select 
count(*),last_recruiting_stage from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where requisition_id = 'JR24-10012' group by 2;

where candidate_id = 
'6d5a1418ffe42e88bba5d6895216e1405e944a52dfbd57581f8d81ef734ba4f6e2ba0e0c779e3576280b51814562796a46166d587321b6f38c75c9b1022ea369'

Application Received
Offer
Ready for Hire
Interview
Background Check
Screen


where requisition_id = 'JR24-10012';



truncate table "PO_HRIS_DB"."Application".PO_WD_REQUISITION;

select TO_TIMESTAMP_NTZ(last_recruiting_stage_change_moment, 'YYYY/MM/DD HH24:MI'),to_date(added_dt, 'YYYY/MM/DD HH24:MI'),to_date(REQ_CREATED_MOMENT, 'YYYY/MM/DD HH24:MI'),* select distinct source_filename from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG limit 10 ;where reference_id = 'JOB_APPLICATION-3-1141887';

TO_CHAR(TO_TIMESTAMP_NTZ(last_recruiting_stage_change_moment), 'YYYY-MM-DD HH24:MI')::timestamp_ntz

select TO_TIMESTAMP_NTZ('last_recruiting_stage_change_moment', 'YYYY/MM/DD HH24:MI')

select added_dt,*  from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where added_dt is not null limit 10;

select source_system,division,* from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where source_system = 'Current Workday Production'--39569

null - a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26

select 
* from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where ca =
'88fbca56bd9cf3ce788e74acf50833df5b4a5aa17da0e62a6dffbaa6d33c67a30c5929afb5a7746d6c87f8103ae0518e24319d3db4c4e747d1e8a0674a83aae3'


SELECT 
requisition_id,max(offer_dt) offer_dt,max(hire_dt) hire_dt,max(Target_Hire_Dt) Target_Hire_Dt,max(Ready_To_Hire_Dt) Ready_To_Hire_Dt,Max(Fill_Dt) as Fill_Dt 
FROM"PO_HRIS_DB"."Application".PO_WD_Candidate c where req_status = 'Open'

group by 1;

where max(offer_dt) is null and Ready_To_Hire_Dt is null and Fill_Dt is not null


select * from PO_STAGE_DB."Worker".JOB_REQ_HASH


create table PO_WD_CANDIDATE_bkp20240318 as


select * from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where internal <> 'No' limit 10;

"PO_HRIS_DB"."Application".PO_WD_CANDIDATE;

create or replace TABLE PO_STAGE_DB."Worker".JOB_REQ_HASH (
	JOB_ID VARCHAR(100),
    BUSINESS_PARTNER VARCHAR(200),
	RECRUITER VARCHAR(200)
    
);

;
SELECT 
distinct req_benifit_code,source_system,count(*)
FROM"PO_HRIS_DB"."Application".PO_WD_Candidate c  group by 1,2;

SELECT 
distinct REQ_JOB_PROFILE
FROM"PO_HRIS_DB"."Application".PO_WD_Candidate c where req_benifit_code is null limit 10;  group by 1,2;


SELECT 
*
FROM"PO_HRIS_DB"."Application".PO_WD_Candidate c where requisition_id = 
'JR22-10646';


select job_requisition,count(distinct last_recruiting_stage)  from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where job_requistion like '%JR21-10703%' ; --Senior Recruiter, Global Talent Acquisition (Filled) group by 1;

select job_requisition,last_recruiting_stage,count(distinct candidate_id)  from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where job_requisition like '%Jr1000%'  group by 1,2;

select job_requisition,last_recruiting_stage,disposition_reason,* from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where upper(job_requisition) like '%JR100164%' ;

select requisition_id,last_recruiting_stage,count( application_id)  from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE where requisition_id in ( 'JR22-10348','JR21-10591','JR23-11032','JR24-10003')  group by 1,2 order by 1,count(distinct application_id) desc;

select disposition_reason,source_system,last_recruiting_stage,count( distinct reference_id)  
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where upper(job_requisition) like '%JR23-11335%' group by 1,2,3;

select *

from PO_HRIS_DB."Application".PO_WD_REQUISITION where job_profile not like '%Contingent%'

Create or replace view 
Select pr.REQUISITION_ID,
pr.JOB_REQUISITION,
pr.REQUISITION_STATUS,
pr.CREATED_MOMENT,
pr.OPEN_DT,
pr.FILL_DT,
pr.HIRE_DT,
pr.CLOSE_DT,
pr.FREEZE_DT,
pr.UNFREEZE_DT,
pr.READY_TO_HIRE_DT,
pr.OFFER_DT,
pr.TARGET_REQ_DT,
pr.HIRING_MANAGER,
pr.Hiring_Manager_ID,
pr.Hiring_Manager_Email,
pr.REQUISITION_COUNTRY,
pr.RECRUITER,
pr.RECRUITER_EMP_ID,
pr.JOB_PROFILE,
pr.BUSINESS_PARTNER,
pr.REQ_LOCATION,
pr.ORG_LEVEL,
pr.BUSINESS_UNIT,
pr.DIVISION,
pr.SUB_DIVISION,
pr.DEPARTMENT,
pr.COMP_GRADE,
pr.COMP_RANGE,
pr.PAY_COMPANY,
pr.SAP_COMPANY,
last_recruiting_stage,
last_recruiting_step,
disposition_reason,
source,
source_category,
Derived_Last_Stage,
count_by_stg 
from 
PO_HRIS_DB."Application".PO_WD_REQUISITION pr left join

 (select  req_id,
    last_recruiting_stage,
    source_category,
    source,
    case 
    when (upper(last_recruiting_stage) = 'SCREEN' or upper(last_recruiting_stage) = 'OFFER')  and (upper(last_recruiting_step) like '%SALARY EXPECTATIONS%' or upper(last_recruiting_step) like '%DUPLICATE%' or 
     upper(last_recruiting_step) like '%WITHDREW%')  then 'Declined'
        when //(upper(last_recruiting_stage) = 'SCREEN' or upper(last_recruiting_stage) = 'APPLICATION RECEIVED')  and 
        disposition_reason is not null
        //and ((last_recruiting_step) like '%Has basic qualifications but not best qualified – Experience%' or (last_recruiting_step) like '%Under 18 Years or Not Authorized to Work in Country%') 
        then 'Rejected' 
    else last_recruiting_stage end as Derived_Last_Stage,
    last_recruiting_step,
    disposition_reason,
    count(distinct application_id)  as count_by_stg
    from

( 
    select *,row_number() over (partition by application_id order by ifnull(last_functionally_updated_dt::date,'1900-01-01') desc) as rks
    from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE 
    where upper(SOURCE_SYSTEM) = 'CURRENT WORKDAY PRODUCTION'
     //and req_id like '%JR100164%' -- example to check number discrepency 
    //group by 1,2,3,4,5,6,7
)pa  
where rks =1 group by 1,2,3,4,5,6,7) a on upper(a.req_id) = upper(pr.requisition_id) ;
//group by 1,2;

//order by requisition_id,Derived_Last_Stage;














select referred_by,referral, *
from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE
where //upper(SOURCE_SYSTEM) = 'CURRENT WORKDAY PRODUCTION' and  

req_id like '%JR23-11302%'

JR23-10847- I have more applications
JR21-10591- Less Applications
Questions:
Status as row or column?
JR20 has missing applicants.- Yes
can we get confirmation on hash fields before we pull the history?

select job_requisition,source_system,req_created_moment,* from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where 
//upper(job_requisition) like '%JR22-11392%' and 
//source_system Like '%Current%';
source_filename like ;
select distinct source_filename, source_system, min(application_dt), max(application_dt),max(last_functionally_updated_dt)
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG group by 1,2 order by 1,2;


select count(*), reference_id,source_system
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG group by 2,3 having count(*)> 1;


select count(*), reference_id
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG  group by 2 having count(*)> 1;--JOB_APPLICATION-3-68158

select count(distinct last_recruiting_stage), reference_id,source_system
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG group by 2,3 having count(distinct last_recruiting_stage)> 1;

JOB_APPLICATION-3-1398943
JOB_APPLICATION-3-1470145
JOB_APPLICATION-3-1148953

select job_application, job_requisition,*
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where length(reference_id) > 30

candidate_id = '0282c8b84eeb2ced805f05850c94eaf26da483a3117617021cb15d852eea73afc15295a7d92a2d0dfeaf8aed59f5c65f0a82c7e7753ad047a5a0d40745d17e7d'

application_dt >= '2024-03-15'



limit 10

where reference_id = 'JOB_APPLICATION-3-68158'

JOB_APPLICATION-3-945b4bfa5d139001cb6e00b9efcb0000

TABLEAU."candidate".VW_JOB_REQ