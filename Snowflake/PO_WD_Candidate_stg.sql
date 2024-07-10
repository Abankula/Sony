--drop database PO_STG_DB
Use warehouse PO_WH;
Use Role SYSADMIN;
/*
DROP DATABASE PO_STAGE_DB ;
CREATE OR REPLACE DATABASE PO_STAGE_DB
COMMENT = 'A Database used to store temporary data in stage tables';


CREATE SCHEMA "PO_STAGE_DB"."Worker"
COMMENT = 'Candidate Application Info';
select * from  "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG limit 10
*/


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
Email  Varchar(130),
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

select last_functionally_updated_dt,JOB_APPLICATION,*
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG 
//limit 10 
where  //last_functionally_updated_dt is not null



job_requisition like '%JR21-10553%'
;
select 
max(length(Candidate_ID )),
max(length(Reference_ID )),
max(length(Application_Dt )),
max(length(Unfreeze_Dt )),
max(length(Freeze_Dt )),
max(length(Last_Functionally_Updated_Dt )),
max(length(Close_Dt )),
max(length(Fill_Dt )),
max(length(Created_On )),
max(length(Location )),
max(length(Hiring_Manager )),
max(length(Email )),
max(length(Phone_Number )),
max(length(Candidate_City )),
max(length(Candidate_Location )),
max(length(Companies )),
max(length(Current_Company )),
max(length(Current_Job_Title )),
max(length(Years_in_Current_Job )),
max(length(Degrees )),
max(length(Degrees_Legacy )),
max(length(Education )),
max(length(Education_Legacy )),
max(length(Schools )),
max(length(Schools_Legacy )),
max(length(Certifications )),
max(length(Certifications_Legacy )),
max(length(Skills )),
max(length(Skills_Legacy )),
max(length(Language )),
max(length(Language_Legacy )),
max(length(Language_Skill )),
max(length(Language_Skill_Legacy )),
max(length(Fields_of_Study )),
max(length(Fields_of_Study_Legacy )),
max(length(Work_Experience )),
max(length(Work_Experience_Legacy )),
max(length(Total_Years_Experience )),
max(length(Disposition_Reason )),
max(length(Duplicate )),
max(length(Duplicate_Legacy )),
max(length(Internal )),
max(length(Offer_Dt )),
max(length(Pre_Screening_Questions )),
max(length(Pre_Screening_Questions_Legacy )),
max(length(Pre_Screening_Answers )),
max(length(Pre_Screening_Answers_Legacy )),
max(length(Supervisory_Organization )),
max(length(Recruiter_Employee_ID )),
max(length(Rehire )),
max(length(Source_System )),
max(length(Job_Application )),
max(length(Added_Dt )),
max(length(Candidate )),
max(length(Source )),
max(length(Jobs_Applied_For )),
max(length(Country )),
max(length(Disability_Status )),
max(length(Ethnicity )),
max(length(Gender )),
max(length(Referral )),
max(length(Referred_by )),
max(length(Referred_By_Employee_ID )),
max(length(Job_Requisition )),
max(length(Country_of_Job_Requisition )),
max(length(Last_Recruiting_Stage )),
max(length(Last_Recruiting_Stage_Change_Moment )),
max(length(Offer_Event )),
max(length(Base_Pay_Proposed_Amount )),
max(length(Scheduled_Weekly_Hours_from_Offer )),
max(length(Job_Profile_Proposed )),
max(length(Location_Proposed )),
max(length(Target_Hire_Dt_from_Offer )),
max(length(Supervisory_Organization_text )),
max(length(Job_Req_Org_Level )),
max(length(Division )),
max(length(Sub_Division )),
max(length(Department )),
max(length(Sub_Department )),
max(length(Employee_Type )),
max(length(Benefit_Code )),
max(length(Recruiter )),
max(length(Recruiter_wd_ID )),
max(length(Target_Hire_Dt_from_Req )),
max(length(Pay_Transparency_Range )),
max(length(Req_Created_Moment )),
max(length(Date_Moved_To_ReadyHire )),
max(length(Worker_SubType )),
max(length(Pay_Company )),
max(length(Bonus_Target_Percent_Proposed )),
max(length(One_Time_Payment )),
max(length(Approved_by_Workers )),
max(length(Approved_by_Workers_Legacy )),
max(length(Comp_Grade )),
max(length(Pay_Range_Min )),
max(length(Pay_Range_Mid )),
max(length(Pay_Range_Max )),
max(length(Pay_Range_Currency_ID )),
max(length(Candidate_Address )),
max(length(Job_Profile )),
max(length(Source_Category )),
max(length(Last_Recruiting_Step )),
max(length(Hire_Dt ))
from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG;

--Application object with JSON data
create or replace transient table PO_WD_APPLICATION_JSON (
App_Json variant,
created_timestamp timestamp
);

REFERRAL,
OFFER_EVENT,
Candidate_ID_43401045,
Supervisory_Organization_as_Text,

SHOW TABLES ;

select length('Fill Date: 03/04/2024')

select * from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG  where Requisition_Status like '%Fill%' --626654

'%Isabelle Fang%' (Referral) ‎- JR22-10599 Financial Analyst, Motion Picture Finance Group- Labels/ Overhead limit 10;

where application_dt::date between '2020-01-01' and '2020-06-30' limit 10;--74237;

truncate table PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG;

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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = '.*WD_Job_Applications_*.*_20240301.*csv' //20231214 and 20231213 need to be used for hsitory load 20240301,0302,0303
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

select distinct job_application,JOB_REQUISITION,REQ_CREATED_MOMENT,freeze_dt,unfreeze_dt,offer_dt,target_hire_dt_from_offer,target_hire_dt_from_req,Date_Moved_To_ReadyHire,job_profile,* from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where  like '%JR22-10676%' and HIRE_DT is not null;


select JOB_REQUISITION,count(distinct worker_subtype) 
select distinct source_filename from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG 

group by 1 having count(distinct worker_subtype) > 1;

drop table PO_HRIS_DB."Application".PO_WD_APPLICATION;
Fill Date: 03/04/2024
select distinct source_filename
from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where JOB_REQUISITION like '%JR21-11446%'

where last_functionally_updated_dt is not null group by 1 having count(distinct Pay_Transparency_Range) > 1;

select * from PO_HRIS_DB."Application".PO_WD_CANDIDATE


select count(*),job_requisition from PO_STAGE_DB."Worker".PO_WD_APPLICATION_STG where HIRE_DT is not null group by 2 having count(*) > 1;


WD_Job_Applications_202211_202302_20231208_hashed

select count(*),candidate_id from PO_HRIS_DB."Application".PO_WD_CANDIDATE group by 2 having count(*)> 30

where //workday_id = '550abe7977490101a590b3d421d30000'

select * from PO_HRIS_DB."Application".PO_WD_CANDIDATE where
candidate_id = 'e930468c09686fe01ed7e3bf2c90ddfc7cb920c258fe55ab4ef8573108da84080441b9356e29a20a1bf81cc4a1c1c64f49ecb85439c6935052011d62d94c3665' 


