truncate table PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG;

select distinct worker_t
 from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG limit 10;
 
 where length(last_recruiting_stage_change_moment) <> 16 limit 10 
;

delete from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where source_filename = 'outbound/WD_Job_Applications_202307_202403_20240318_hashed.csv'

/*

history load 20240316,0317,0318 this file 

for reconcile we don't need data before 2020-01-01
delete from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where application_dt::date < '2020-01-01' and source_filename ='outbound/WD_Job_Applications_Recon_202401_20240310_20240311_hashed.csv'


*/


create or replace pipe PO_STAGE_DB."survey".p_new_hire_survey_load 
auto_ingest = true 
as;
copy into PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG
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
//$12,--hirirng manager id 
//$13,--hirirng manager email 
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
//pattern = '.*WD_Job_Applications_Recon_*.*_.*csv'
pattern = '.*WD_Job_Applications_.*_20240502.*csv' 
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

WD_Job_Applications_202404_202405_
/*stream for exit*/
create or replace stream "PO_STAGE_DB"."survey".S_NEW_HIRE_SURVEY_LOAD
COPY GRANTS on table "PO_STAGE_DB"."survey".po_new_hire_survey_stage
APPEND_ONLY = TRUE
;

alter task t_new_hire_survey_load resume;

/*Task for Newhire*/
create or replace task PO_HRIS_DB."survey".t_new_hire_survey_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 0 16-17 * * * America/Chicago'
//Schedule = '1 Minute'
when system$stream_has_data('"PO_STAGE_DB"."survey"."S_NEW_HIRE_SURVEY_LOAD"')
as 
Call sp_new_hire_load((to_char(current_date -1,'YYYYMMDD') )::int)
;

select *
  from table(information_schema.task_history())
  order by scheduled_time;
  
show tasks

alter task PO_HRIS_DB."survey".t_new_hire_survey_load resume;

alter task PO_HRIS_DB."survey".t_new_hire_survey_load suspend;

select recruiter_wd_id,* from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG limit 10;

CREATE OR REPLACE TABLE  "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG
(Candidate_ID  Varchar(130),
Reference_ID  Varchar(30),
Application_Dt  Varchar(10),
Unfreeze_Dt  Varchar(10),
Freeze_Dt  Varchar(10),
Last_Functionally_Updated_Dt  Varchar(),
Close_Dt  Varchar(),
Fill_Dt  Varchar(),
Created_On  Varchar(10),
Location  Varchar(60),
Hiring_Manager  Varchar(130),
Candidate_Email  Varchar(130),
Phone_Number  Varchar(20),
Candidate_City  Varchar(150),
Candidate_Location  Varchar(160),
Companies  Varchar(),
Current_Company  Varchar(),
Current_Job_Title  Varchar(),
Years_in_Current_Job  Varchar(10),
Degrees  Varchar(),
Degrees_Legacy  Varchar(),
Education  Varchar(),
Education_Legacy  Varchar(),
Schools  Varchar(),
Schools_Legacy  Varchar(),
Certifications  Varchar(),
Certifications_Legacy  Varchar(),
Skills  Varchar(),
Skills_Legacy  Varchar(),
Language  Varchar(),
Language_Legacy  Varchar(),
Language_Skill  Varchar(),
Language_Skill_Legacy  Varchar(),
Fields_of_Study  Varchar(),
Fields_of_Study_Legacy  Varchar(),
Work_Experience  Varchar(),
Work_Experience_Legacy  Varchar(),
Total_Years_Experience  Varchar(10),
Disposition_Reason  Varchar(70),
Duplicate  Varchar(),
Duplicate_Legacy  Varchar(),
Internal  Varchar(10),
Offer_Dt  Varchar(10),
Pre_Screening_Questions  Varchar(),
Pre_Screening_Questions_Legacy  Varchar(),
Pre_Screening_Answers  Varchar(),
Pre_Screening_Answers_Legacy  Varchar(),
Supervisory_Organization  Varchar(),
Recruiter_Employee_ID  Varchar(130),
Rehire  Varchar(10),
Source_System  Varchar(30),
Job_Application  Varchar(190),
Added_Dt  Varchar(),
Candidate  Varchar(130),
Source  Varchar(70),
Jobs_Applied_For  Varchar(),
Country  Varchar(30),
Disability_Status  Varchar(80),
Ethnicity  Varchar(100),
Gender  Varchar(30),
Referral  Varchar(),
Referred_by  Varchar(130),
Referred_By_Employee_ID  Varchar(130),
Job_Requisition  Varchar(130),
Country_of_Job_Requisition  Varchar(30),
Last_Recruiting_Stage  Varchar(20),
Last_Recruiting_Stage_Change_Moment  Varchar(30),
Offer_Event  Varchar(170),
Base_Pay_Proposed_Amount  Varchar(10),
Scheduled_Weekly_Hours_from_Offer  Varchar(10),
Job_Profile_Proposed  Varchar(90),
Location_Proposed  Varchar(60),
Target_Hire_Dt_from_Offer  Varchar(10),
Supervisory_Organization_text  Varchar(130),
Job_Req_Org_Level  Varchar(20),
Division  Varchar(50),
Sub_Division  Varchar(60),
Department  Varchar(60),
Sub_Department  Varchar(70),
Employee_Type  Varchar(40),
Benefit_Code  Varchar(70),
Recruiter  Varchar(130),
Recruiter_wd_ID  Varchar(40),
Target_Hire_Dt_from_Req  Varchar(10),
Pay_Transparency_Range  Varchar(),
Req_Created_Moment  Varchar(100),
Date_Moved_To_ReadyHire  Varchar(10),
Worker_SubType  Varchar(40),
Pay_Company  Varchar(50),
Bonus_Target_Percent_Proposed  Varchar(10),
One_Time_Payment  Varchar(10),
Approved_by_Workers  Varchar(),
Approved_by_Workers_Legacy  Varchar(),
Comp_Grade  Varchar(30),
Pay_Range_Min  Varchar(10),
Pay_Range_Mid  Varchar(10),
Pay_Range_Max  Varchar(10),
Pay_Range_Currency_ID  Varchar(),
Candidate_Address  Varchar(),
Job_Profile  Varchar(90),
Source_Category  Varchar(30),
Last_Recruiting_Step  Varchar(80),
Hire_Dt  Varchar(10),
Source_Filename Varchar
)
CLUSTER BY (Candidate_ID,Application_Dt);


-- add business unit, region, city. No recruiter workday id and   in final table


create or replace TABLE PO_HRIS_DB."Application".PO_WD_CANDIDATE (
	APPLICATION_DT DATE NOT NULL,
    CANDIDATE_ID VARCHAR(128) NOT NULL,
    APPLICATION_ID VARCHAR(100) NOT NULL,
    JOB_REQUISITION VARCHAR(1000),
    REQ_ID VARCHAR(30) NOT NULL,
	REQ_STATUS VARCHAR(30) NOT NULL,
	REQ_CREATED_ON TIMESTAMP_NTZ(9),
	REQ_OPEN_DT DATE NOT NULL,
	REQ_CLOSE_DT DATE,
	REQ_FREEZE_DT DATE,
	REQ_UNFREEZE_DT DATE,
	REQ_TARGET_DT DATE,
	READY_TO_HIRE_DT DATE,
	OFFER_DT DATE,
	TARGET_HIRE_DT DATE,
	HIRE_DT DATE,
    FILL_DT DATE,
	ADDED_DT DATE,
	Candidate_Email VARCHAR(128),
	PHONE_NUMBER VARCHAR(20),
	STREET_ADDRESS VARCHAR(16777216),
	CITY VARCHAR(16777216),
	COUNTRY VARCHAR(30),
	LOCATION VARCHAR(16777216),
	PREVIOUS_COMPANY VARCHAR(16777216),
	CURRENT_COMPANY VARCHAR(16777216),
	CURRENT_JOB_TITLE VARCHAR(16777216),
	TENURE_YEAR NUMBER(38,0),
	EXPERIENCE_YEAR NUMBER(38,0),
	PREVIOUS_WORK_EXPERIENCE VARCHAR(16777216),
	DEGREE VARCHAR(16777216),
	EDUCATION VARCHAR(16777216),
	SCHOOL VARCHAR(16777216),
	CERTIFICATIONS VARCHAR(16777216),
	PRIMARY_SKILL VARCHAR(16777216),
	LANGUGAE VARCHAR(16777216),
	LANGUAGE_SKILL VARCHAR(16777216),
	FIELDS_OF_STUDY VARCHAR(16777216),
	DISABILITY_STATUS VARCHAR(100),
	ETHNICITY VARCHAR(100),
	GENDER VARCHAR(30),
	SOURCE VARCHAR(200),
	SOURCE_CATEGORY VARCHAR(30),
	REHIRE BOOLEAN,
	APPLICATION_LOCATION VARCHAR(100),
    Worker_SubType  Varchar(40),
	LAST_RECRUITING_STAGE VARCHAR(50) NOT NULL,
	LAST_RECRUITING_STEP VARCHAR(500) NOT NULL,
	LAST_RECRUITING_STAGE_DT TIMESTAMP_NTZ(9) NOT NULL,
	OFFER_STATUS VARCHAR(500),
	DUPLICATE_APPLICATION VARCHAR(500),
	DISPOSITION_REASON VARCHAR(500),
	INTERNAL VARCHAR(10),
	REFERRAL VARCHAR(500),
	REFERRED_BY VARCHAR(128),
	REFERRED_EMP_ID VARCHAR(128),
	OFFER_BASE_PAY_AMOUNT VARCHAR(10),
	OFFER_WEEKLY_HOURS VARCHAR(10),
	OFFER_JOB_PROFILE VARCHAR(100),
	//OFFER_LOCATION VARCHAR(100), same as location
	OFFER_MANAGER VARCHAR(128),
	PRE_SCREENING_QUESTIONS VARCHAR(16777216),
	PRE_SCREENING_ANSWERS VARCHAR(16777216),
	SOURCE_SYSTEM VARCHAR(16777216),
	CANDIDATE VARCHAR(128),
	JOBS_APPLIED VARCHAR(16777216),
	BONUS_TARGET_PERCENT_PROPOSED VARCHAR(16777216),
	ONE_TIME_PAYMENT VARCHAR(16777216),
	APPROVED_BY_WORKERS VARCHAR(16777216),
    LAST_FUNCTIONALLY_UPDATED_DT DATE,
    REQ_HIRING_MANAGER VARCHAR(128) NOT NULL,
	REQ_COUNTRY VARCHAR(100),
	REQ_RECRUITER VARCHAR(1000),
	REQ_RECRUITER_EMP_ID VARCHAR(128),
    REQ_JOB_PROFILE VARCHAR(100),
	//REQ_BUSINESS_PARTNER VARCHAR(128),
	REQ_LOCATION VARCHAR(100),
	REQ_ORG_LEVEL VARCHAR(100),
	REQ_DIVISION VARCHAR(100),
	REQ_SUB_DIVISION VARCHAR(100),
	REQ_DEPARTMENT VARCHAR(200),
	REQ_SUB_DEPARTMENT VARCHAR(100),
	REQ_EMPLOYEE_TYPE VARCHAR(100),
	REQ_BENIFIT_CODE VARCHAR(100),
	REQ_COMP_GRADE VARCHAR(100),
	REQ_COMP_GRADE_MIN VARCHAR(10),
	REQ_COMP_GRADE_MID VARCHAR(10),
	REQ_COMP_GRADE_MAX VARCHAR(10),
	REQ_PAY_COMPANY VARCHAR(100),
	REQ_PAY_TRANSPARENCY_RANGE VARCHAR(16777216),
	SOURCE_FILENAME VARCHAR(500),
	CREATED_DATETIME TIMESTAMP_NTZ(9) NOT NULL,
	MODIFIED_DATETIME TIMESTAMP_NTZ(9) NOT NULL,
	CREATED_BY VARCHAR(100) NOT NULL,
	MODIFIED_BY VARCHAR(100) NOT NULL,
	BATCH_ID NUMBER(38,0) NOT NULL
)CLUSTER BY (CANDIDATE_ID,APPLICATION_DT);

select distinct last_recruiting_stage_change_moment from tt_job_can where last_recruiting_stage_change_moment is null

upper(SOURCE_SYSTEM) <> 'CURRENT WORKDAY PRODUCTION'  limit 10;

  // WD_Job_Applications_Workday_202403_20240401_20240404_hashed.csv
   
create or replace temp table tt_job_can as
    select *,row_number() over (partition by reference_id,source_system,application_dt,last_functionally_updated_dt order by ifnull(last_functionally_updated_dt::date,'1900-01-01') desc  ) rk
from (
    SELECT 
        distinct
        upper(trim((substr((aps.job_requisition),charindex('JR',(aps.job_requisition),0),charindex(' ',(aps.job_requisition),0))))) Req_ID ,
         trim(reverse(substr(reverse(aps.job_requisition),charindex(')',reverse(aps.job_requisition),0)+1,charindex('(',reverse(aps.job_requisition),0)-2))) as Req_Status,
       
        Candidate_ID ,
        trim(substr(Reference_ID,position('-',Reference_ID,1)+1,200)) as Reference_ID,
        Application_Dt ,
        Last_Functionally_Updated_Dt ,
        date_moved_to_readyhire,
        Created_On ,
        Email ,
        Phone_Number ,
        Candidate_City ,
        Candidate_Location ,
        Companies as Previous_Company,
        Current_Company ,
        Current_Job_Title ,
        Years_in_Current_Job ,
        ifnull(Degrees,Degrees_Legacy) as Degrees,
        ifnull(Education ,Education_Legacy) Education,
        ifnull(Schools, Schools_Legacy) Schools,
        ifnull(Certifications ,Certifications_Legacy)Certifications ,
        ifnull(Skills ,Skills_Legacy) Skills ,
        ifnull(Language ,Language_Legacy) Language,
        ifnull(Language_Skill ,Language_Skill_Legacy) Language_Skill,
        ifnull(Fields_of_Study ,Fields_of_Study_Legacy) Fields_of_Study,
        ifnull(Work_Experience ,Work_Experience_Legacy) Work_Experience,
        Total_Years_Experience ,
        Disposition_Reason ,
        ifnull(Duplicate ,Duplicate_Legacy) Duplicate,
        Internal ,
        Offer_Dt ,
        ifnull(Pre_Screening_Questions ,Pre_Screening_Questions_Legacy) Pre_Screening_Questions,
        ifnull(Pre_Screening_Answers ,Pre_Screening_Answers_Legacy) Pre_Screening_Answers,
        Rehire ,
        Source_System ,
       case when length(added_dt) = 16 then TO_TIMESTAMP_NTZ(added_dt, 'YYYY/MM/DD HH24:MI') else  added_dt end as added_dt ,
        Candidate ,
        Source ,
        Jobs_Applied_For ,
        Country ,
        Disability_Status ,
        Ethnicity ,
        Gender ,
        Referral ,
        Referred_by ,
        Referred_By_Employee_ID ,
        Job_Requisition ,
        Last_Recruiting_Stage ,
        --last_recruiting_stage_change_moment,
       case when length(last_recruiting_stage_change_moment) = 16 then TO_TIMESTAMP_NTZ(last_recruiting_stage_change_moment, 'YYYY/MM/DD HH24:MI') else  last_recruiting_stage_change_moment end as 
    Last_Recruiting_Stage_Change_Moment ,
        Offer_Event ,
        Base_Pay_Proposed_Amount ,
        Scheduled_Weekly_Hours_from_Offer ,
        Job_Profile_Proposed ,
        Location_Proposed ,
        Target_Hire_Dt_from_Offer ,
        Supervisory_Organization_text ,
        Bonus_Target_Percent_Proposed ,
        One_Time_Payment ,
        ifnull(Approved_by_Workers,Approved_by_Workers_Legacy) as Approved_by_Workers,
        Candidate_Address ,
        Source_Category ,
        Last_Recruiting_Step ,
        Hire_Dt ,
        Fill_Dt,
        aps.Country_of_Job_Requisition,
        aps.HIRING_MANAGER,
        aps.DIVISION,
        aps.SUB_DIVISION,
        aps.DEPARTMENT,
        aps.SUB_DEPARTMENT,
        substr(aps.Job_Req_Org_Level,1,2) as Org_Level,
        aps.JOB_PROFILE,
        aps.BENEFIT_CODE,
        aps.RECRUITER,
        aps.RECRUITER_EMPLOYEE_ID,
        aps.Location,
        aps.Comp_Grade,
        aps.Pay_Range_Min ,
        aps.Pay_Range_Mid ,
        aps.Pay_Range_Max ,
        aps.Employee_Type,
        aps.Pay_Transparency_Range,
        aps.Pay_Company,
        aps.worker_subtype,
        case when length(REQ_CREATED_MOMENT) = 16 then TO_TIMESTAMP_NTZ(REQ_CREATED_MOMENT, 'YYYY/MM/DD HH24:MI') else  REQ_CREATED_MOMENT end as Open_Date ,
        aps.UNFREEZE_DT,
        aps.FREEZE_DT,
        aps.Close_DT,
        aps.target_hire_dt_from_req,
        trim(substr(aps.source_filename,charindex('/',aps.source_filename,0)+1,100)) as source_filename,
        trim(substr(aps.source_filename,position('_',aps.source_filename,30)+1,6)) as filename_dt
    FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG aps 
   
    )A 
;

Delete from "PO_HRIS_DB"."Application".PO_WD_Candidate pc using tt_job_can c 
 where c.candidate_id = pc.candidate_id 
 and Upper(pc. REQ_ID)=Upper(c.Req_ID) 
 and Upper(pc.Last_Recruiting_Step)= Upper(c.Last_Recruiting_Step) 
 and ifnull(c.Last_Functionally_Updated_Dt, '9999-12-31') = ifnull(pc.Last_Functionally_Updated_Dt,'9999-12-31')
 //and Upper(ifnull(pc.source,'abc'))= Upper(ifnull(c.source,'abc'))
 ;



INSERT INTO PO_HRIS_DB."Application".PO_WD_CANDIDATE
(
APPLICATION_DT,
CANDIDATE_ID,
APPLICATION_ID,
REQ_ID,
job_requisition,
REQ_STATUS,
REQ_CREATED_ON,
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
ADDED_DT,
Candidate_Email,
PHONE_NUMBER,
STREET_ADDRESS,
CITY,
COUNTRY,
LOCATION,
PREVIOUS_COMPANY,
CURRENT_COMPANY,
CURRENT_JOB_TITLE,
TENURE_YEAR,
EXPERIENCE_YEAR,
PREVIOUS_WORK_EXPERIENCE,
DEGREE,
EDUCATION,
SCHOOL,
CERTIFICATIONS,
PRIMARY_SKILL,
LANGUGAE,
LANGUAGE_SKILL,
FIELDS_OF_STUDY,
DISABILITY_STATUS,
ETHNICITY,
GENDER,
SOURCE,
SOURCE_CATEGORY,
REHIRE,
APPLICATION_LOCATION,
LAST_RECRUITING_STAGE,
LAST_RECRUITING_STEP,
LAST_RECRUITING_STAGE_DT,
OFFER_STATUS,
DUPLICATE_APPLICATION,
DISPOSITION_REASON,
INTERNAL,
REFERRAL,
REFERRED_BY,
REFERRED_EMP_ID,
OFFER_BASE_PAY_AMOUNT,
OFFER_WEEKLY_HOURS,
OFFER_JOB_PROFILE,
//OFFER_LOCATION,
OFFER_MANAGER,
PRE_SCREENING_QUESTIONS,
PRE_SCREENING_ANSWERS,
SOURCE_SYSTEM,
CANDIDATE,
JOBS_APPLIED,
BONUS_TARGET_PERCENT_PROPOSED,
ONE_TIME_PAYMENT,
APPROVED_BY_WORKERS,
LAST_FUNCTIONALLY_UPDATED_DT,
REQ_HIRING_MANAGER,
REQ_COUNTRY,
REQ_RECRUITER,
REQ_RECRUITER_EMP_ID,
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
CREATED_DATETIME,
MODIFIED_DATETIME ,
CREATED_BY,
MODIFIED_BY ,
BATCH_ID 
)
SELECT
Application_Dt ,
Candidate_ID ,
Reference_ID,
REQ_ID,
  job_requisition,
REQ_STATUS,
CREATED_ON,
Open_Date,
Close_DT,
FREEZE_DT,
UNFREEZE_DT,
target_hire_dt_from_req,
Date_Moved_To_ReadyHire,
OFFER_DT,
Target_Hire_Dt_from_Offer,
HIRE_DT,
FILL_DT,
ADDED_DT,
Email,
PHONE_NUMBER,
Candidate_Address,
Candidate_CITY,
COUNTRY,
LOCATION,
Previous_Company,
CURRENT_COMPANY,
CURRENT_JOB_TITLE,
Years_in_Current_Job,
Total_Years_Experience,
Work_Experience,
Degrees,
Education,
Schools,
Certifications ,
Skills,
Language,
Language_Skill,
Fields_of_Study,
Disability_Status ,
Ethnicity ,
Gender ,
SOURCE,
SOURCE_CATEGORY,
REHIRE,
LOCATION,
LAST_RECRUITING_STAGE,
LAST_RECRUITING_STEP,
last_recruiting_stage_change_moment,
Offer_Event,
DUPLICATE,
DISPOSITION_REASON,
INTERNAL,
REFERRAL,
REFERRED_BY,
Referred_By_Employee_ID,
Base_Pay_Proposed_Amount,
Scheduled_Weekly_Hours_from_Offer,
Job_Profile_Proposed,
//OFFER_LOCATION,
Supervisory_Organization_text,
PRE_SCREENING_QUESTIONS,
PRE_SCREENING_ANSWERS,
SOURCE_SYSTEM,
CANDIDATE,
JOBS_APPLIED_FOR,
BONUS_TARGET_PERCENT_PROPOSED,
ONE_TIME_PAYMENT,
APPROVED_BY_WORKERS,
LAST_FUNCTIONALLY_UPDATED_DT,
HIRING_MANAGER,
Country_of_Job_Requisition,
RECRUITER,
RECRUITER_EMPLOYEE_ID,
JOB_PROFILE,
LOCATION,
ORG_LEVEL,
DIVISION,
SUB_DIVISION,
DEPARTMENT,
SUB_DEPARTMENT,
EMPLOYEE_TYPE,
Worker_SubType,
BENEFIT_CODE,
COMP_GRADE,
Pay_Range_Min ,
Pay_Range_Mid ,
Pay_Range_Max ,
PAY_COMPANY,
PAY_TRANSPARENCY_RANGE,
current_timestamp(),
current_timestamp(),
current_user(),
current_user(),
20240404
From tt_job_can where rk =1;


        
//call sp_job_application_load(20240317)

CREATE OR REPLACE PROCEDURE sp_job_application_load(Batch_ID int)
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
sp_name string;


begin


record_date := current_date();
created_datetime := current_timestamp(); 
modified_datetime := current_timestamp(); 
created_by := current_user();
modified_by :=  current_user();
sp_name :=  'sp_job_application_load';

/*
Notes:
Job_application_as_text, Supervisor_Organization: fields are ignored from stage
Referral,Offer_event: Populates based on condition
Last_functionally_updated_dt has no data
Status "Open" : fill date is not populated.
If there are no candidates assigned to req, there will be no req details
canidates older than 6 months with no updated need to deleted from system
Hire date and fill date are different
recruiter is na in workday if he is contractor 
Add no of job applicants, hired applicants before delete
Application date and last updated date need to call separate
*/


create or replace temp table tt_job_can as
    select *,row_number() over(partition by Reference_ID,Last_Recruiting_Stage order by Last_Recruiting_Stage_Change_Moment::date desc ) rk
    //row_number() over(partition by Candidate_ID,Req_ID,Last_Recruiting_Step,ifnull(source,'abc') order by Last_Recruiting_Stage_Change_Moment::date desc ) rk 
    from (
    SELECT 
        distinct
        upper(trim((substr((aps.job_requisition),charindex('JR',(aps.job_requisition),0),charindex(' ',(aps.job_requisition),0))))) Req_ID ,
         trim(reverse(substr(reverse(aps.job_requisition),charindex(')',reverse(aps.job_requisition),0)+1,charindex('(',reverse(aps.job_requisition),0)-2))) as Req_Status,
        Candidate_ID ,
        trim(substr(Reference_ID,position('-',Reference_ID,1)+1,30)) as Reference_ID,
        Application_Dt ,
        Last_Functionally_Updated_Dt ,
        date_moved_to_readyhire,
        //Created_On ,
        Email ,
        Phone_Number ,
        Candidate_City ,
        Candidate_Location ,
        Companies ,
        Current_Company ,
        Current_Job_Title ,
        Years_in_Current_Job ,
        ifnull(Degrees,Degrees_Legacy) as Degrees,
        ifnull(Education ,Education_Legacy) Education,
        ifnull(Schools, Schools_Legacy) Schools,
        ifnull(Certifications ,Certifications_Legacy)Certifications ,
        ifnull(Skills ,Skills_Legacy) Skills ,
        ifnull(Language ,Language_Legacy) Language,
        ifnull(Language_Skill ,Language_Skill_Legacy) Language_Skill,
        ifnull(Fields_of_Study ,Fields_of_Study_Legacy) Fields_of_Study,
        ifnull(Work_Experience ,Work_Experience_Legacy) Work_Experience,
        Total_Years_Experience ,
        Disposition_Reason ,
        ifnull(Duplicate ,Duplicate_Legacy) Duplicate,
        Internal ,
        Offer_Dt ,
        ifnull(Pre_Screening_Questions ,Pre_Screening_Questions_Legacy) Pre_Screening_Questions,
        ifnull(Pre_Screening_Answers ,Pre_Screening_Answers_Legacy) Pre_Screening_Answers,
        Rehire ,
        Source_System ,
              case when length(added_dt) = 16 then TO_TIMESTAMP_NTZ(added_dt, 'YYYY/MM/DD HH24:MI') else  added_dt end as added_dt ,
       -- added_dt,
        --to_date(added_dt, 'YYYY/MM/DD HH24:MI') as Added_Dt ,
        Candidate ,
        Source ,
        Jobs_Applied_For ,
        Country ,
        Disability_Status ,
        Ethnicity ,
        Gender ,
        Referral ,
        Referred_by ,
        Referred_By_Employee_ID ,
        Job_Requisition ,
        Last_Recruiting_Stage ,
        --last_recruiting_stage_change_moment,
       case when length(last_recruiting_stage_change_moment) = 16 then TO_TIMESTAMP_NTZ(last_recruiting_stage_change_moment, 'YYYY/MM/DD HH24:MI') else  last_recruiting_stage_change_moment end as Last_Recruiting_Stage_Change_Moment ,
        Offer_Event ,
        Base_Pay_Proposed_Amount ,
        Scheduled_Weekly_Hours_from_Offer ,
        Job_Profile_Proposed ,
        Location_Proposed ,
        Target_Hire_Dt_from_Offer ,
        Supervisory_Organization_text ,
        Bonus_Target_Percent_Proposed ,
        One_Time_Payment ,
        ifnull(Approved_by_Workers,Approved_by_Workers_Legacy) as Approved_by_Workers,
        Candidate_Address ,
        Source_Category ,
        Last_Recruiting_Step ,
        Hire_Dt ,
        Fill_Dt,
        trim(substr(aps.source_filename,charindex('/',aps.source_filename,0)+1,100)) as source_filename,
        trim(substr(aps.source_filename,position('_',aps.source_filename,30)+1,6)) as filename_dt
    FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG aps 
   where aps.source_system = 'Legacy Workday Production'
    )A 
;



Delete from "PO_HRIS_DB"."Application".PO_WD_Candidate pc 
using tt_job_can c 
where c.Reference_ID =  pc.Application_ID;

Delete from "PO_HRIS_DB"."Application".PO_WD_Candidate pc using tt_job_can c 
 where c.candidate_id = pc.candidate_id 
 and Upper(pc. Requisition_ID)=Upper(c.Req_ID) 
 and Upper(pc.Last_Recruiting_Step)=Upper(c.Last_Recruiting_Step) 
 and Upper(ifnull(pc.source,'abc'))= Upper(ifnull(c.source,'abc'))
 ;
 
INSERT INTO  "PO_HRIS_DB"."Application".PO_WD_Candidate
(
Candidate_ID,
//Job_Application,
Req_Status,
Requisition_ID,
Application_ID,
Application_Dt,
Ready_To_Hire_Dt,
Offer_Dt,
Target_Hire_Dt,
Hire_Dt,
Last_Functionally_Updated_Dt,
Added_Dt,
Fill_Dt,
Email,
Phone_Number ,
Street_Address,
City,
Country,
Location,
Previous_Company,
Current_Company,
Current_Job_Title,
Tenure_Year,
Experience_Year,
Previous_Work_Experience,
Degree,
Education,
School,
Certifications,
Primary_Skill,
Langugae,
Language_Skill,
Fields_Of_Study,
Disability_Status,
Ethnicity,
Gender,
Source,
Source_Category,
Rehire,
Application_Location,
Last_Recruiting_Stage,
Last_Recruiting_Step,
Last_Recruiting_Stage_Dt,
Offer_Status,
Duplicate_Application,
Disposition_Reason,
Internal,
Referral,
Referred_By,
Referred_Emp_ID,
Offer_Base_Pay_Amount,
Offer_Weekly_Hours,
Offer_Job_Profile,
Offer_Manager,
Pre_Screening_Questions,
Pre_Screening_Answers,
Source_System ,
Candidate ,
Jobs_Applied ,
Bonus_Target_Percent_Proposed ,
One_Time_Payment ,
Approved_by_Workers ,
Source_Filename,
Created_Datetime,
Modified_Datetime,
Created_By,
Modified_By,
Batch_ID

)
SELECT 
  distinct
        c.Candidate_ID ,
        //c.Job_Application,
        c.Req_Status,
        c.Req_ID ,
        c.Reference_ID ,
        c.Application_Dt ,
        c.date_moved_to_readyhire,
        c.Offer_Dt ,
        c.Target_Hire_Dt_from_Offer,
        c.Hire_Dt,
        c.Last_Functionally_Updated_Dt ,
        c.Added_Dt ,
        c.Fill_Dt,
        c.Email ,
        c.Phone_Number ,
        c.Candidate_Address ,
        c.Candidate_City ,
        c.Country,
        c.Candidate_Location ,
        c.Companies ,
        c.Current_Company ,
        c.Current_Job_Title ,
        c.Years_in_Current_Job ,
        c.Total_Years_Experience ,
        c.Work_Experience,
        c.Degrees,
        c.Education,
        c.Schools,
        c.Certifications ,
        c.Skills,
        c.Language,
        c.Language_Skill,
        c.Fields_of_Study,
        c.Disability_Status ,
        c.Ethnicity ,
        c.Gender ,
        c.Source ,
        c.Source_Category ,
        c.Rehire ,
        c.Location_Proposed ,
        c.Last_Recruiting_Stage ,
        c.Last_Recruiting_Step ,
        c.Last_Recruiting_Stage_Change_Moment,
        c.Offer_Event ,
        c.Duplicate ,
        c.Disposition_Reason ,
        c.Internal ,
        c.Referral ,
        c.Referred_by ,
        c.Referred_By_Employee_ID ,
        c.Base_Pay_Proposed_Amount ,
        c.Scheduled_Weekly_Hours_from_Offer ,
        c.Job_Profile_Proposed ,
        c.Supervisory_Organization_text ,
        c.Pre_Screening_Questions,
        c.Pre_Screening_Answers,
        c.Source_System ,
        c.Candidate ,
        c.Jobs_Applied_For ,
        c.Bonus_Target_Percent_Proposed ,
        c.One_Time_Payment ,
        c.Approved_by_Workers ,
        c.source_filename,
         :created_datetime ,
         :modified_datetime ,
         :created_by ,
         :modified_by ,
         :Batch_ID 
 FROM  tt_job_can c 
 where c.rk = 1 
 ;




/* Create Temp table from stage Req level*/


create or replace temp table tt_job_req as
 select *,
     Row_number() over(partition by Req_id order by filename_dt desc ) rk,case when requisition_id is not null then 'U' else 'I' end Operation from
(     SELECT 
        distinct
        trim(reverse(substr(reverse(aps.job_requisition),charindex(')',reverse(aps.job_requisition),0)+1,charindex('(',reverse(aps.job_requisition),0)-2))) as Req_Status,
       upper( trim((substr((aps.job_requisition),charindex('JR',(aps.job_requisition),0),charindex(' ',(aps.job_requisition),0))))) Req_ID ,
     
        aps.job_requisition,
             case when length(REQ_CREATED_MOMENT) = 16 then TO_TIMESTAMP_NTZ(REQ_CREATED_MOMENT, 'YYYY/MM/DD HH24:MI') else  REQ_CREATED_MOMENT end as Open_Date ,
   
        aps.UNFREEZE_DT,
        aps.FREEZE_DT,
        aps.Close_DT,
   
        aps.target_hire_dt_from_req,
   
        aps.Country_of_Job_Requisition,
        aps.HIRING_MANAGER,
        aps.DIVISION,
        aps.SUB_DIVISION,
        aps.DEPARTMENT,
        aps.SUB_DEPARTMENT,
        substr(aps.Job_Req_Org_Level,1,2) as Org_Level,
        aps.JOB_PROFILE,
        aps.BENEFIT_CODE,
        aps.RECRUITER,
        aps.RECRUITER_EMPLOYEE_ID,
        aps.Location,
        aps.Comp_Grade,
        aps.Pay_Range_Min ,
        aps.Pay_Range_Mid ,
        aps.Pay_Range_Max ,
        aps.Employee_Type,
        aps.Pay_Transparency_Range,
        aps.Pay_Company,
        aps.worker_subtype,
        trim(substr(aps.source_filename,charindex('/',aps.source_filename,0)+1,100)) as source_filename,
         trim(substr(aps.source_filename,position('_',aps.source_filename,30)+1,6)) as filename_dt,
         r.requisition_id
   FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG aps left join "PO_HRIS_DB"."Application".PO_WD_REQUISITION r on r.requisition_id = req_id 
  where aps.source_system = 'Legacy Workday Production'
)A ;


    
/* Insert Req level records*/


INSERT INTO "PO_HRIS_DB"."Application".PO_WD_REQUISITION
(
        Requisition_Status,
        Requisition_ID ,
        Job_Requisition,
        Open_Dt,
        Unfreeze_Dt, 
        Freeze_Dt,
        //Ready_To_Hire_Dt ,
        //Offer_Dt,
        //Fill_Dt ,
        Close_Dt ,
        //Target_Offer_Dt,
        Target_Req_Dt,
       // Hire_Dt ,
        Requisition_Country,
        HIRING_MANAGER,
        DIVISION,
        SUB_DIVISION,
        DEPARTMENT,
        SUB_DEPARTMENT,
        ORG_LEVEL,
        JOB_PROFILE,
        BENIFIT_CODE,
        Recruiter,
        Recruiter_Emp_ID ,
        REQ_LOCATION,
        Comp_Grade,
        Comp_Grade_Min ,
        Comp_Grade_Mid ,
        Comp_Grade_Max,
        Employee_Type,
        Pay_Transparency_Range,
        Pay_Company,
        Source_Filename,
        Created_Datetime,
        Modified_Datetime,
        Created_By ,
        Modified_By ,
        Batch_ID 

)
  

select tr.Req_Status,
        tr.Req_ID ,
        tr.job_requisition,
        tr.Open_Date,
        tr.UNFREEZE_DT,
        tr.FREEZE_DT,
        //tr.date_moved_to_readyhire,
        //tr.offer_dt,
        //tr.hire_dt as Fill_dt,
        Close_dt,
       // tr.target_hire_dt_from_offer,
        tr.target_hire_dt_from_req,
       // tr.hire_dt,
        tr.Country_of_Job_Requisition,
        tr.HIRING_MANAGER,
        tr.DIVISION,
        tr.SUB_DIVISION,
        tr.DEPARTMENT,
        tr.SUB_DEPARTMENT,
        tr.Org_Level,
        tr.JOB_PROFILE,
        tr.BENEFIT_CODE,
        tr.RECRUITER,
        tr.RECRUITER_EMPLOYEE_ID,
        tr.Location,
        tr.Comp_Grade,
        tr.Pay_Range_Min ,
        tr.Pay_Range_Mid ,
        tr.Pay_Range_Max ,
        tr.Employee_Type ,
        tr.Pay_Transparency_Range,
        tr.Pay_Company,
        tr.source_filename,
         :created_datetime ,
         :modified_datetime ,
         :created_by ,
         :modified_by ,
         :Batch_ID 
FROM tt_job_req tr 
where rk =1 and operation = 'I';



Update "PO_HRIS_DB"."Application".PO_WD_REQUISITION r
set hire_dt =a.hire_dt,
Target_Offer_Dt= a.Target_Hire_Dt,
ready_to_hire_dt= a.Ready_To_Hire_Dt,
offer_dt = a.offer_dt,
Fill_Dt = a.Fill_Dt,
Modified_Datetime = :modified_datetime,
Modified_By = :modified_by
FROM (
SELECT requisition_id,max(offer_dt) offer_dt,max(hire_dt) hire_dt,max(Target_Hire_Dt) Target_Hire_Dt,max(Ready_To_Hire_Dt) Ready_To_Hire_Dt,Max(Fill_Dt) as Fill_Dt FROM"PO_HRIS_DB"."Application".PO_WD_Candidate c 
//where ifnull(offer_dt,Ready_To_Hire_Dt) is not null -- Unable to update fill date, due to there 
group by 1
)A where r.requisition_id = a.requisition_id
;

/*Add update statement here*/

Update "PO_HRIS_DB"."Application".PO_WD_REQUISITION r
set Unique_Candidate = a.can,
Total_Application = a.tot,
Hired= a.hire,
Modified_Datetime = :modified_datetime,
Modified_By = :modified_by
//Modified_Datetime = current_timestamp(),
//Modified_By = current_user()
FROM (
SELECT requisition_id,count(distinct candidate_id) as can,count(distinct Application_ID) as tot,sum( case when hire_dt is not null then 1 else 0 end) as hire  FROM "PO_HRIS_DB"."Application".PO_WD_Candidate c 
group by 1
)A where r.requisition_id = a.requisition_id
//Where upper(REQ_STATUS) = ('Filled') --add it during daily loads
;
/* Delete 6 months no activity candidates*/

/*
Delete from "PO_HRIS_DB"."Application".PO_WD_Candidate c using 
(SELECT distinct candidate_id,requisition_id,last_recruiting_stage_dt, (current_date()-last_recruiting_stage_dt::date) as Days
from "PO_HRIS_DB"."Application".PO_WD_Candidate
where upper(req_status) IN ( 'FILLED') and Days > 60 )f where f.candidate_id = c.candidate_id and upper(c.req_status) IN ( 'FILLED')
;
*/

Return 'Done';

  END;
  $$;