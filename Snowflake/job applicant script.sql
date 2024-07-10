/*

drop table 
--truncate table PO_WD_APPLICATION_STG;
INSERT INTO from PO_WD_APPLICATION_STG 
  (
        JOB_APPLICATION,
        JOB_APPLICATION_ID,
        Recruiting_Start_Date,
        APPLICATION_DATE,
        REQ_CHANGE_DATE,
        CANDIDATE,
        JOB_APPLICATION_LOCATION,
        HIRING_MANAGER,
        POSITION_SOURCE,
        Source_Category,
        CANDIDATE_ID,
        --LEGAL_FIRST_NAME,
        --LEGAL_LAST_NAME,
        CANDIDATE_EMAIL,
        STREET_ADDRESS,
        PHONE_NUMBER,
        CITY,
        Candidate_Location,
        PREVIOUS_COMPANY,
        COUNTRY,
        CURRENT_COMPANY,
        JOB_TITLE,
        TENURE_YEAR,
         DEGREE,
        EDUCATION,
        SCHOOL,
        CERTIFICATIONS,
        PRIMARY_SKILL,
        LANGUGAE,
        LANGUAGE_SKILL,
        FIELDS_OF_STUDY,
        PREVIOUS_WORK_EXPERIENCE,
        EXPERIENCE_YEARS,
        DISABILITY_STATUS,
        DISPOSITION_REASON,
        ETHNICITY,
        GENDER,
        DUPLICATE_APPLICATION,
        INTERNAL,
        REFERRAL,
        REFERRED_BY,
        REFERRED_EMP_ID,
        JOB_REQUISITION,
        REQ_COUNTRY,
       LAST_RECRUITING_STAGE,
        Last_Recruiting_Step,
        LAST_RECRUITING_STAGE_DATE,
        OFFER_DATE,
        OFFER_STATUS,
        OFFER_BASE_PAY_AMOUNT,
        OFFER_WEEKLY_HOURS,
        OFFER_JOB_PROFILE,
        OFFER_LOCATION,
        OFFER_MANAGER,
        TARGET_HIRE_DATE,
        Hire_Date,
        --PRE_SCREENING_QUESTIONS,
        --PRE_SCREENING_ANSWERS,
        Req_Location,
        JOB_PROFILE,
        --SUPERVISORY_ORG,
        ORG_LEVEL,
        --IS_EVERGREEN,
        DIVISION,
        SUB_DIVISION,
        DEPARTMENT,
        SUB_DEAPRTMENT,
        --Masked_Configuration,
        --Masked_Configuration_Override,
        EMPLOYEE_TYPE,
        BENIFIT_CODE,
        Recruiter,
        Recruiter_Employee_ID,
        --Recruiter_Workday_ID, 
        Target_Hire_Date_Req, 
        --Pay_Transparency_Range_Req, 
        Requisition_Created_Moment ,
        Date_Moved_to_Ready_for_Hire ,
        --Worker_Sub_Type_Hiring_Requirement ,
        --Job_Requisition_Pay_Company ,
        --Rehire ,
        --Bonus_Target_Percent_Proposed ,
        --One_Time_Payments_Amount_Requested_Proposed ,
        --Approved_By_Workers ,
        Comp_Grade ,
        Comp_Grade_Min ,
        Comp_Grade_Mid ,
        Comp_Grade_Max
      
) 
select $1,
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
--$12,
--$13,
--$14,
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
--$58,
--$59,
$60,
$61,
--$62,
$63,
--$64,
$65,
$66,
$67,
$68,
--$69,
--$70,
$71,
$72,
$73,
$74,
--$75,
$76,
--$77,
$78,
$79,
--$80,
--$81,
--$82,
--$83,
--$84,
--$85,
$86,
$87,
$88,
$89
from @worker_load_instg/Job_Application2.csv (file_format => 'csv_load_format' ) t;

SELECT 
reverse(substr(reverse(job_requisition),charindex(')',reverse(job_requisition),0)+1,charindex('(',reverse(job_requisition),0)-2)) as Job_Status,
JOB_APPLICATION,
CANDIDATE_ID,
        JOB_APPLICATION_ID,
        Recruiting_Start_Date,--1
        APPLICATION_DATE,
        REQ_CHANGE_DATE,
        CANDIDATE,
        JOB_APPLICATION_LOCATION,
        HIRING_MANAGER,--1
        POSITION_SOURCE,
        Source_Category,
        --LEGAL_FIRST_NAME,
        --LEGAL_LAST_NAME,
        (CANDIDATE_EMAIL),
        STREET_ADDRESS,
        PHONE_NUMBER,
        CITY,
        Candidate_Location,
        PREVIOUS_COMPANY,
        COUNTRY,
        CURRENT_COMPANY,
        JOB_TITLE,
        TENURE_YEAR,
         DEGREE,
        EDUCATION,
        SCHOOL,
        CERTIFICATIONS,
        PRIMARY_SKILL,
        LANGUGAE,
        LANGUAGE_SKILL,
        FIELDS_OF_STUDY,
        PREVIOUS_WORK_EXPERIENCE,
        EXPERIENCE_YEARS,
        DISABILITY_STATUS,
        DISPOSITION_REASON,
        ETHNICITY,
        GENDER,
        DUPLICATE_APPLICATION,
        INTERNAL,
        REFERRAL,
        REFERRED_BY,
        REFERRED_EMP_ID,
        JOB_REQUISITION,
        REQ_COUNTRY,
        Last_Recruiting_Stage,
        Last_Recruiting_Step,
        Last_Recruiting_Stage_Date,
        OFFER_DATE,
        OFFER_STATUS,
        OFFER_BASE_PAY_AMOUNT,
        OFFER_WEEKLY_HOURS,
        OFFER_JOB_PROFILE,
        OFFER_LOCATION,
        OFFER_MANAGER,
        TARGET_HIRE_DATE,
        Hire_Date,
        --PRE_SCREENING_QUESTIONS,
        --PRE_SCREENING_ANSWERS,
        Req_Location,--1
        JOB_PROFILE,--1
        --SUPERVISORY_ORG,--1--1
        ORG_LEVEL,--1
        DIVISION,--1
        SUB_DIVISION,--1
        DEPARTMENT,--1--1
        SUB_DEAPRTMENT,--1
        EMPLOYEE_TYPE,--1
        BENIFIT_CODE,--1
        Recruiter,--1
        Recruiter_Employee_ID,--1
        --Recruiter_Workday_ID, --1
        Target_Hire_Date_Req, 
        --Pay_Transparency_Range_Req, 
        Requisition_Created_Moment ,
        Date_Moved_to_Ready_for_Hire 
       -- Worker_Sub_Type_Hiring_Requirement ,
        --Job_Requisition_Pay_Company ,
        --Rehire ,
        --Bonus_Target_Percent_Proposed ,
        --One_Time_Payments_Amount_Requested_Proposed ,
        --Approved_By_Workers ,
        --Comp_Grade ,--1
        --Comp_Grade_Min ,--1
        --Comp_Grade_Mid ,--1
        --Comp_Grade_Max --1
        FROM PO_WD_APPLICATION_STG where-- phone_number is null
    
        trim((substr((JOB_APPLICATION),charindex('JR',(JOB_APPLICATION),0),11))) = 'JR23-10014'; and JOB_APPLICATION like '%Alyssa%' ;

--Req Load step

select distinct trim((substr((JOB_APPLICATION),charindex('JR',(JOB_APPLICATION),0),11))) Req_ID ,
OFFER_DATE,
TARGET_HIRE_DATE,
HIRE_DATE 

FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG;

Update "PO_HRIS_DB"."Application".PO_WD_REQUISITION
SET OFFER_DATE = '05/25/2023',
HIRE_DATE = '09/05/2023'
WHere trim(Requisition_id) = 'JR23-10922';

Update "PO_HRIS_DB"."Application".PO_WD_REQUISITION
SET OFFER_DATE = '05/11/2023',
Close_date = '05/11/2023'
WHere trim(Requisition_id) = 'JR23-10014';

 INSERT INTO "PO_HRIS_DB"."Application".PO_WD_REQUISITION
--select * from "PO_HRIS_DB"."Application".PO_WD_REQUISITION
--delete from "PO_HRIS_DB"."Application".PO_WD_REQUISITION
(
        Requisition_Status,
        Requisition_ID ,
        Open_Date,
        Requisition_Created_Moment,
        Requisition_Country,
        HIRING_MANAGER,
        DIVISION,
        SUB_DIVISION,
        DEPARTMENT,
        SUB_DEPARTMENT,
        JOB_REQUISITION,
       -- SUPERVISORY_ORG,
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
        Created_Datetime,
        Modified_Datetime,
        Created_By ,
        Modified_By ,
        Batch_ID 

)
     SELECT 
        distinct
        reverse(substr(reverse(job_requisition),charindex(')',reverse(job_requisition),0)+1,charindex('(',reverse(job_requisition),0)-2)) as Req_Status,
        --JOB_APPLICATION,
        trim((substr((JOB_APPLICATION),charindex('JR',(JOB_APPLICATION),0),11))) Req_ID ,
        Recruiting_Start_Date as Open_Date,
        Requisition_Created_Moment,
        REQ_COUNTRY,
        hash(HIRING_MANAGER),
        DIVISION,
        SUB_DIVISION,
        DEPARTMENT,
        SUB_DEAPRTMENT,
        JOB_REQUISITION,
        --hash(SUPERVISORY_ORG),
        ORG_LEVEL,
        JOB_PROFILE,
        BENIFIT_CODE,
        hash(RECRUITER),
        hash(RECRUITER_EMPLOYEE_ID),
        REQ_LOCATION,
        Comp_Grade,
        Comp_Grade_Min ,
        Comp_Grade_Mid ,
        Comp_Grade_Max,
        Employee_Type,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_USER,
        CURRENT_USER,
        20230917
    FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG
;     



--select * from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE;

INSERT INTO "PO_HRIS_DB"."Application".PO_WD_CANDIDATE
(
   
     Candidate_ID  
    ,REQUISITION_ID  
    ,JOB_APPLICATION_ID 
    ,APPLICATION_DATE
    ,REQ_CHANGE_DATE
    --,Legal_First_Name 
   -- ,Legal_Last_Name 
    ,Location 
    --,Phone_Number 
    ,Email 
    ,Street_Address 
    ,City 
    ,Country 
    ,Previous_Company 
    ,Current_Company
    ,Job_Title 
    ,Tenure_Year 
    ,Experience_Year 
    ,Previous_Work_Experience
    ,Degree 
    ,Education 
    ,School 
    ,Certifications 
    ,Primary_Skill 
    ,Langugae 
    ,Language_Skill 
    ,Fields_Of_Study 
    ,Disability_Status 
    ,Ethnicity 
    ,Gender 
    ,Created_Datetime
    ,Modified_Datetime
    ,Created_By 
    ,Modified_By 
    ,Batch_ID 
)
SELECT 
hash(substr((Candidate_ID),charindex('-',(Candidate_ID),0)+1,11)) as Candidate_ID,
trim((substr((JOB_APPLICATION),charindex('JR',(JOB_APPLICATION),0),11))) Req_ID ,
(substr((JOB_APPLICATION_ID),charindex('-',(JOB_APPLICATION_ID),0)+1,11)) as JOB_APPLICATION_ID,
APPLICATION_DATE,
REQ_CHANGE_DATE,
--CANDIDATE,
--LEGAL_FIRST_NAME,
--LEGAL_LAST_NAME,
CANDIDATE_LOCATION,
--hash(PHONE_NUMBER) as PHONE_NUMBER,
hash(CANDIDATE_EMAIL) as CANDIDATE_EMAIL,
STREET_ADDRESS,
CITY,
COUNTRY,
PREVIOUS_COMPANY,
CURRENT_COMPANY,
JOB_TITLE,
TENURE_YEAR,
EXPERIENCE_YEARS,
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
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP,
CURRENT_USER,
CURRENT_USER,
20230917
FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG;

select * from "PO_HRIS_DB"."Application".PO_WD_Application order by trim(job_application),last_recruiting_stage_date;
INSERT INTO "PO_HRIS_DB"."Application".PO_WD_Application
   (  Candidate_ID
    ,Job_Application 
    ,Application_ID 
    ,Application_Date  
    ,Req_Change_Date  
    ,Position_Source 
    ,Source_Category
    ,Last_Recruiting_Stage 
    ,Last_Recruiting_Step
    ,Last_Recruiting_Stage_Date 
    ,DISPOSITION_REASON
    ,DUPLICATE_APPLICATION
    ,Internal 
    ,Referral 
    ,Referred_By 
    ,Referred_Emp_ID 
    ,Offer_Date 
    ,Offer_Status 
    ,Offer_Base_Pay_Amount 
    ,Offer_Weekly_Hours 
    ,Offer_Job_Profile 
    ,Offer_Location 
    ,Offer_Manager 
    ,Target_Hire_Date 
    ,HIRE_DATE
    ,Created_Datetime
    ,Modified_Datetime
    ,Created_By 
    ,Modified_By 
    ,Batch_ID 
    )
SELECT 
hash(substr((Candidate_ID),charindex('-',(Candidate_ID),0)+1,11)) as Candidate_ID,
trim((substr((JOB_APPLICATION),charindex('JR',(JOB_APPLICATION),0),11))) Req_ID ,
(substr((JOB_APPLICATION_ID),charindex('-',(JOB_APPLICATION_ID),0)+1,11)) as JOB_APPLICATION_ID,
APPLICATION_DATE,
REQ_CHANGE_DATE,
POSITION_SOURCE,
Source_Category,
LAST_RECRUITING_STAGE,
Last_Recruiting_Step,
LAST_RECRUITING_STAGE_DATE,
DISPOSITION_REASON,
DUPLICATE_APPLICATION,
INTERNAL,
hash(REFERRAL),
REFERRED_BY,
hash(REFERRED_EMP_ID),
OFFER_DATE,
OFFER_STATUS,
OFFER_BASE_PAY_AMOUNT,
OFFER_WEEKLY_HOURS,
OFFER_JOB_PROFILE,
OFFER_LOCATION,
OFFER_MANAGER,
TARGET_HIRE_DATE,
Hire_Date,
 Date_Moved_to_Ready_for_Hire ,
--PRE_SCREENING_QUESTIONS,
--PRE_SCREENING_ANSWERS,
CURRENT_TIMESTAMP,
CURRENT_TIMESTAMP,
CURRENT_USER,
CURRENT_USER,
20230917
FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG;

CREATE VIEW "PO_HRIS_DB"."Worker".po_wd_Requisition_vw as 
select R.*
,C.No_Of_Applicants 
from 
"PO_HRIS_DB"."Application".PO_WD_REQUISITION R
left join (select count(*) as No_Of_Applicants,REQUISITION_ID from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE  group by REQUISITION_ID)C 
on  R.REQUISITION_ID = C.REQUISITION_ID;
//select * from  tt_job_can c where rk > 1 and target_hire_dt_from_offer is not null

/*
select count(distinct offer_dt),req_id from  tt_job_can c where rk=1 group by 2 having count( distinct offer_dt) > 1;

JR23-10265
JR22-11303
JR22-11354
JR23-10011
JR23-10385
JR23-10400

select count(distinct Supervisory_Organization_text) from   "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG c

select max(applicant_dt) from    "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG  c where Last_Functionally_Updated_Dt is not null

select Target_Hire_Dt_from_Offer,offer_dt,date_moved_to_readyhire,hire_dt, rk,* from  tt_job_can c where  offer_dt is not null and hire_dt is  null;


select Target_Hire_Dt_from_Offer,offer_dt,date_moved_to_readyhire,hire_dt, rk,* from  tt_job_can c where  offer_dt is not null and hire_dt is not null;

select  count(distinct Last_Recruiting_Stage_Change_Moment),Last_Recruiting_Step,source
from  tt_job_can c where req_id = 'JR22-11303' group by 2,3 having count(*) > 1;


order by candidate_id,Last_Recruiting_Step,Last_Recruiting_Stage_Change_Moment

where candidate_id = '5a5fab4e9f31bc3a8ca951abbc8addc38c47bac1c7c4e04afba92d88368ec391545e37b5e7552084f30244db8d6fb0f901ebd8e0bbbb273476e301b260e1e7d9' and rk =1
offer_dt is not null;

a164561297166015f27c763c8d46917f3fc45807f69798981b3dfa8e311f5db04df37f543a508ec8f40c8b1aae23fcc986837c3c8927f602d8eebd36be956bd4
8341939be89f50b142b0c1690ac7c5eb0223b2edffc336bfcae1813a0eefcf7e16151be763ed7b570aecbdc3ed51dd8f94a1affcf2207ed867e1c7f48454ba3a	
 
inner join (select distinct candidate_id,req_id from  tt_job_can where hire_dt is not null) h on c.candidate_id= h.candidate_id and c.req_id= h.req_id
where  source_system = 'Legacy Workday Production' group by 2 having count(*)
 > 1;


select c.Last_Recruiting_Stage_Change_Moment ,c.Last_Recruiting_Step,* from  tt_job_can c
inner join (select distinct candidate_id,req_id from  tt_job_can where hire_dt is not null) h on c.candidate_id= h.candidate_id and c.req_id= h.req_id
where  source_system = 'Legacy Workday Production' and c.candidate_id = 

'571d44cd006c0f52b80dfdda8d22032ffb95f6cceaf3b07e8bbec827a86f6225d735db0070e8a02bed4e865775051e4d4a26a0da5c6bfa3515253db4066fb820'

188d2c593877ab9fdad3aae3b3162151a768239f25b0fcfb9f9da5e686e10771d018006ed570db5a95148affe417ba50df42254839244b59b224538b1205341c
571d44cd006c0f52b80dfdda8d22032ffb95f6cceaf3b07e8bbec827a86f6225d735db0070e8a02bed4e865775051e4d4a26a0da5c6bfa3515253db4066fb820
select count(*),reference_id from  tt_job_can where source_system = 'Legacy Workday Production'    group by 2 having count(*) > 1;

9837d50f01c950fff699752da898a91946229b5321c902e94456921f46b8c0c865aeca965cdbe8345b56722ee75bd27ea7937089a7dc6b030c276ca7235f8e38	JR23-10626


select distinct Last_Recruiting_Stage,Last_Recruiting_Stage_Change_Moment,* from  tt_job_can where //reference_id = 'JOB_APPLICATION-3-1459719'
candidate_id = '5a5fab4e9f31bc3a8ca951abbc8addc38c47bac1c7c4e04afba92d88368ec391545e37b5e7552084f30244db8d6fb0f901ebd8e0bbbb273476e301b260e1e7d9' and Req_id = 'JR22-11135'
and rk = 1

and Last_Recruiting_Step = 'Completion';

5a5fab4e9f31bc3a8ca951abbc8addc38c47bac1c7c4e04afba92d88368ec391545e37b5e7552084f30244db8d6fb0f901ebd8e0bbbb273476e301b260e1e7d9	JR22-11135

select Application_Dt,job_application,Last_Recruiting_Stage ,
Last_Recruiting_Stage_Change_Moment ,Last_Recruiting_Step ,* from tt_job_can where //Last_Recruiting_Stage_Change_Moment is null;
candidate_id = 
'5d163e88de6459e05f50255b7fecd91620990e3951e0dc6ca9db198b7df1afa44966a1d3656a9ee88ac4b9b86b42b0ddcff08f92b30e083ec405599c913b6d78'
;
select count(*),candidate_id,req_id,last_recruiting_stage,source_filename from
(
SELECT distinct candidate_id,
email,
phone_number,
candidate_location,
disability_status,
ethnicity,
gender,
req_id,
last_recruiting_stage,
source_filename,
filename_dt 
FROM tt_job_can 
where source_system = 'Legacy Workday Production' 
)A
group by 2,3,4,5 having count(*) > 1
,source_system
//Last_Recruiting_Stage_Change_Moment is null;
candidate_id = 
'2414d46f4c3e1bf9d08f8a2f8d0b881fc537ab8de81558fc64ffbd3ca55ff0a8979135eb9fc3f39b837fb15c705a1f1a1f477bf7eae9599e1029ccc52d6a8031'
;

select count(distinct Reference_ID) from tt_job_can  group by 2,3,4 having count(distinct Reference_ID)
> 2



*/

Isabelle Fang (Referral) ‎- JR22-10599 Financial Analyst, Motion Picture Finance Group- Labels/ Overhead

select count(*),candidate_id,requisition_id from "PO_HRIS_DB"."Application".PO_WD_Candidate group by 2,3 having count(*) > 1;
--Old
select applition_dt,application_id,Last_Recruiting_Step,source,*
from "PO_HRIS_DB"."Application".PO_WD_Candidate where candidate_id =
'dae5b2af02a52f464c32bd3128324860f7a10b5a70c1df71c667ea186bc8e5fd34ff9939fda69fa31ba35576118c321ddd610b103d5baa3cf513f5e0e68a6eaa';

select requisition_id,open_dt,offer_dt,target_offer_dt,fill_dt,close_dt,* from "PO_HRIS_DB"."Application".PO_WD_REQUISITION where requisition_id = 'JR20-10072'

select job_requisition,req_created_moment,unfreeze_dt,offer_dt,freeze_dt,close_dt,fill_dt,* from "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG where close_dt is not null limit 10

job_requisition like '%JR22-11626%'

--12/22/2023

truncate table "PO_HRIS_DB"."Application".PO_WD_Candidate

select count(*) from "PO_HRIS_DB"."Application".PO_WD_Candidate where Applition_Dt between '2020-01-01' and '2020-06-30'


create or replace temp table tt_job_can as
    select *,row_number() over(partition by Candidate_ID,Req_ID,Last_Recruiting_Step,ifnull(source,'abc') order by Last_Recruiting_Stage_Change_Moment::date desc ) rk from (
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
        //Supervisory_Organization ,
        Rehire ,
        Source_System ,
        Job_Application ,
        Added_Dt ,
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
        trim(substr(aps.source_filename,charindex('/',aps.source_filename,0)+1,100)) as source_filename,
        trim(substr(aps.source_filename,position('_',aps.source_filename,30)+1,6)) as filename_dt
    FROM "PO_STAGE_DB"."Worker".PO_WD_APPLICATION_STG aps //where  source_system = 'Legacy Workday Production' 
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
Job_Application,
Req_Status,
Requisition_ID,
Application_ID,
Applition_Dt,
Ready_To_Hire_Dt,
Offer_Dt,
Target_Hire_Dt,
Hire_Dt,
Last_Functionally_Updated_Dt,
Added_Dt,
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
Jobs_Applied_For ,
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
        c.Job_Application,
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
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_USER,
        CURRENT_USER,
        20231213
 FROM  tt_job_can c 
 where c.rk = 1 ;




/* Create Temp table from stage Req level*/
-- add no of job applicants, hired applicants before delete

create or replace temp table tt_job_req as
 select *,
     Row_number() over(partition by Req_id order by filename_dt desc ) rk,case when requisition_id is not null then 'U' else 'I' end Operation from
(     SELECT 
        distinct
        trim(reverse(substr(reverse(aps.job_requisition),charindex(')',reverse(aps.job_requisition),0)+1,charindex('(',reverse(aps.job_requisition),0)-2))) as Req_Status,
       upper( trim((substr((aps.job_requisition),charindex('JR',(aps.job_requisition),0),charindex(' ',(aps.job_requisition),0))))) Req_ID ,

        aps.job_requisition,
        aps.REQ_CREATED_MOMENT as Open_Date,
        aps.UNFREEZE_DT,
        aps.FREEZE_DT,

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
   where  source_system = 'Legacy Workday Production' 
)A ;


    
/* Insert Req level records*/

INSERT INTO "PO_HRIS_DB"."Application".PO_WD_REQUISITION
--select count(*) from "PO_HRIS_DB"."Application".PO_WD_REQUISITION
--delete from "PO_HRIS_DB"."Application".PO_WD_REQUISITION
(
        Requisition_Status,
        Requisition_ID ,
        Job_Requisition,
        Open_Dt,
        Unfreeze_Dt, 
        Freeze_Dt,
        Close_Dt ,
        Target_Req_Dt,
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
        null as close_date,
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
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        CURRENT_USER,
        CURRENT_USER,
        20231211
        
FROM tt_job_req tr 
where rk =1 and operation = 'I';

Update "PO_HRIS_DB"."Application".PO_WD_REQUISITION r
set hire_dt =a.hire_dt,
Target_Offer_Dt= a.Target_Hire_Dt,
ready_to_hire_dt= a.Ready_To_Hire_Dt,
offer_dt = a.offer_dt
FROM (
SELECT requisition_id,max(offer_dt) offer_dt,max(hire_dt) hire_dt,max(Target_Hire_Dt) Target_Hire_Dt,max(Ready_To_Hire_Dt) Ready_To_Hire_Dt FROM "PO_HRIS_DB"."Application".PO_WD_Candidate c 
where ifnull(offer_dt,Ready_To_Hire_Dt) is not null
group by 1
)A where r.requisition_id = a.requisition_id
;

Update "PO_HRIS_DB"."Application".PO_WD_REQUISITION r
set candidate_count = a.can,
Hired= a.hire
FROM (
SELECT requisition_id,count(distinct candidate_id) as can,sum( case when hire_dt is not null then 1 else 0 end) as hire  FROM "PO_HRIS_DB"."Application".PO_WD_Candidate c 
group by 1
)A where r.requisition_id = a.requisition_id
//Where upper(REQ_STATUS) = ('Filled') --add it during daily shots
;
/* Delete 6 month no activity canidatesas*/

Delete from "PO_HRIS_DB"."Application".PO_WD_Candidate c using 
(SELECT distinct candidate_id,requisition_id,last_recruiting_stage_dt, (current_date()-last_recruiting_stage_dt::date) as Days
from "PO_HRIS_DB"."Application".PO_WD_Candidate
where upper(req_status) IN ( 'FILLED') and Days > 60 )f where f.candidate_id = c.candidate_id and upper(c.req_status) IN ( 'FILLED')
;

select max(application_dt) from "PO_HRIS_DB"."Application".PO_WD_Candidate  limit 10;