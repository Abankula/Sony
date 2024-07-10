Use warehouse PO_WH;
Use Role SYSADMIN;
Use Database PO_Stage_DB;

list @Worker_LOAD_INSTG

remove @worker_Load_instg PATTERN='.*.csv';

delete from PO_WD_APPLICATION_STG;

-- File Format
CREATE OR REPLACE FILE FORMAT csv_load_format
TYPE = 'CSV'
COMPRESSION = AUTO 
file_extension = '.csv'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1

   --TRIM_SPACE = TRUE
  ;

  -- File Format
CREATE OR REPLACE FILE FORMAT csv_load_format_pipe
TYPE = 'CSV'
COMPRESSION = AUTO 
file_extension = '.csv'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
SKIP_HEADER = 1
FIELD_DELIMITER = '|'
   --TRIM_SPACE = TRUE
  ;
  
CREATE OR REPLACE FILE FORMAT csv_load_format_skip
TYPE = 'CSV'
COMPRESSION = AUTO 
file_extension = '.csv'
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
--SKIP_HEADER = 1
   --TRIM_SPACE = TRUE
  ;
  -- File Format
CREATE OR REPLACE FILE FORMAT json_load_format
  TYPE = 'JSON'
  COMPRESSION = none
  STRIP_OUTER_ARRAY = true
  file_extension = '.json'
  ALLOW_DUPLICATE = TRUE 
   --TRIM_SPACE = TRUE
  ;

  
--Internal Stage
Create or replace Stage worker_Load_instg
FILE_FORMAT = json_load_format;

--run cmd to load files into stage
--put file://C:\Users\abankula\Documents\Job_Application\*.csv @"Worker".worker_load_instg AUTO_COMPRESS=false SOURCE_COMPRESSION=NONE OVERWRITE=TRUE;

-- Transient table creation
create or replace transient table PO_WD_APPLICATION_JSON (
App_Json variant
);

-- Copy Data into Transient table

  INSERT INTO  PO_WD_APPLICATION_STG 
  (
        JOB_APPLICATION,
        JOB_APPLICATION_ID,
        APPLICATION_DATE,
        LEGAL_FIRST_NAME,
        LEGAL_LAST_NAME,
        PHONE_NUMBER,
        CANDIDATE_EMAIL,
        REQ_CHANGE_DATE,
        CANDIDATE,
        JOB_APPLICATION_LOCATION,
        HIRING_MANAGER,
        POSITION_SOURCE,
        STREET_ADDRESS,
        CITY,
        COUNTRY,
        CANDIDATE_LOCATION,
        JOBS_APPLIED,-- No data
        PREVIOUS_COMPANY,
        CURRENT_COMPANY,
        JOB_TITLE,
        TENURE_YEAR,
        EXPERIENCE_YEARS,
        DEGREE,
        EDUCATION,
        SCHOOL,
        CERTIFICATIONS,
        PRIMARY_SKILL,
        LANGUGAE,
        LANGUAGE_SKILL,
        FIELDS_OF_STUDY,
        PREVIOUS_WORK_EXPERIENCE,
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
        REQ_LOCATION,
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
        PRE_SCREENING_QUESTIONS,
        PRE_SCREENING_ANSWERS,
        JOB_PROFILE,
        SUPERVISORY_ORG,
        ORG_LEVEL,
        DIVISION,
        SUB_DIVISION,
        DEPARTMENT,
        SUB_DEAPRTMENT,
        EMPLOYEE_TYPE,
        BENIFIT_CODE,
        Recruiter,
        Recruiter_Employee_ID,
        Recruiter_Workday_ID, 
        Target_Hire_Date_Req, 
        Pay_Transparency_Range_Req, 
        Requisition_Created_Moment ,
        Date_Moved_to_Ready_for_Hire ,
        Worker_Sub_Type_Hiring_Requirement ,
        Job_Requisition_Pay_Company ,
        Rehire ,
        Bonus_Target_Percent_Proposed ,
        One_Time_Payments_Amount_Requested_Proposed ,
        Approved_By_Workers ,
        Comp_Grade ,
        Comp_Grade_Min ,
        Comp_Grade_Mid ,
        Comp_Grade_Max
) 
Select
 t.value:Job_Application::String as Job_Application,
t.value:referenceID::String as Reference_ID,
t.value:Application_Date::String as Application_Date,
t.value:Legal_First_Name::String as Legal_First_Name,
t.value:Legal_Last_Name::String as Legal_Last_Name,
t.value:Phone_Number::String as Phone_Number,
t.value:Email::String as Email,
t.value:Created_On::String as Created_On,
t.value:Candidate::String as Candidate,
t.value:Location_as_Text::String as Location_as_Text,
t.value:Hiring_Manager_as_Text::String as Hiring_Manager_as_Text,
t.value:source::String as Source,
t.value:Candidate_Address::String as Candidate_Address,
t.value:Candidate_City::String as Candidate_City,
t.value:Country::String as Country,
t.value:Candidate_Location::String as Candidate_Location,
null as Jobs_Applied, -- RV
t.value:Companies_as_Text::String as Previuos_Company,
t.value:Current_Company::String as Current_Company,
t.value:Current_Job_Title::String as Current_Job_Title,
t.value:Years_in_Current_Job::String as Years_in_Current_Job,
t.value:Total_Years_Experience::String as Total_Years_Experience,
t.value:"Degrees"::String as Degrees,
t.value:education::String as Education,
t.value:Schools::String as Schools,
t.value:Certifications::String as Certifications,
t.value:skills::String as Skills,
t.value:Language::String as Language,
t.value:Language_Skill::String as Language_Skill,
t.value:Fields_of_Study::String as Fields_of_Study,
t.value:experience::String as Work_Experience,
t.value:Disability_Status::String as Disability_Status,
t.value:Disposition_Reason::String as Disposition_Reason,
t.value:Ethnicity::String as Ethnicity,
t.value:Gender::String as Gender,
t.value:Duplicates_for_Prospect_or_Job_Application::String as Duplicates_for_Prospect_or_Job_Application,
t.value:Internal::String as Internal,
t.value:Referral::String as Referral,
t.value:Referred_by::String as Referred_by,
t.value:Referred_By_Employee_ID::String as Referred_By_Employee_ID,
t.value:Job_Requisition::String as Job_Requisition,
t.value:Country_of_Job_Requisition::String as Country_of_Job_Requisition,
t.value:Location::String as Location,
t.value:Last_Recruiting_Stage::String as Last_Recruiting_Stage,
t.value:Last_Recruiting_Step::String as Last_Recruiting_Step,
t.value:Last_Recruiting_Stage_Change_Moment::String as Last_Recruiting_Stage_Change_Moment,
t.value:Offer_Date::String as Offer_Date,
t.value:Offer_Event::String as Offer_Event,
t.value:Base_Pay_Amount_from_Offer::String as Base_Pay_Amount_from_Offer,
t.value:Scheduled_Weekly_Hours_from_Offer::String as Scheduled_Weekly_Hours_from_Offer,
t.value:Job_Profile_from_Offer::String as Job_Profile_from_Offer,
t.value:Location_from_Offer::String as Location_from_Offer,
t.value:Manager_from_Offer::String as Manager_from_Offer,
t.value:Target_Hire_Date_from_Offer::String as Target_Hire_Date_from_Offer,
t.value:Hire_Date::String as Hire_Date,
t.value:"Pre-Screening_Questions"::String as Pre_Screening_Questions,
t.value:"Pre-Screening_Answers"::String as Pre_Screening_Answers,
t.value:Job_Profile::String as Job_Profile,
t.value:Supervisory_Organization::String as Supervisory_Organization,
t.value:Org_Level::String as Org_Level,
t.value:Division::String as Division,
t.value:Sub_Division::String as Sub_Division,
t.value:Department::String as Department,
t.value:Sub_Department::String as Sub_Department,
t.value:Employee_Type::String as Employee_Type,
t.value:Benefit_Code::String as Benefit_Code,
t.value:Recruiter::String as Recruiter,
t.value:Recruiter_Employee_ID::String as Recruiter_Employee_ID,
t.value:Recruiter_Workday_ID::String as Recruiter_Workday_ID,
t.value:Target_Hire_Date_from_Requisition::String as Target_Hire_Date_from_Requisition,
t.value:Pay_Transparency_Range_from_Requisition::String as Pay_Transparency_Range_from_Requisition,
t.value:Requisition_Created_Moment::String as Requisition_Created_Moment,
t.value:Date_Moved_to_Ready_for_Hire::String as Date_Moved_to_Ready_for_Hire,
t.value:"Worker_Sub-Type_Hiring_Requirement"::String as Worker_Sub_Type_Hiring_Requirement,
t.value:"Job_Requisition_-_Pay_Company"::String as Job_Requisition_Pay_Company,
t.value:Rehire::String as Rehire,
t.value:Bonus_Target_Percent_Proposed::String as Bonus_Target_Percent_Proposed,
t.value:"One_Time_Payments_Amount_Requested_-_Proposed"::String as OneTime_Payments_Amount_Requested_Proposed,
t.value:Approved_By_Workers::String as Approved_By_Workers,
t.value:Compensation_Grade::String as Compensation_Grade,
t.value:"Compensation_Grade_Range_-_Minimum"::String as Compensation_Grade_Range_Minimum,
t.value:"Compensation_Grade_Range_-_Midpoint"::String as Compensation_Grade_Range_Midpoint,
t.value:"Compensation_Grade_Range_-_Maximum"::String as Compensation_Grade_Range_Maximum
--t.value:Is_Evergreen::String as Is_Evergreen,
--t.value:Masked_Configuration as Masked_Configuration,
--t.value:Masked_Configuration_Override as Masked_Configuration_Override,

select * from @worker_load_instg/Job_Applications_Split1.json (file_format => 'csv_load_format') as S
, table(flatten(S.$1,'Report_Entry')) t;


INSERT INTO  PO_WD_APPLICATION_STG 
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
        LEGAL_FIRST_NAME,
        CANDIDATE_ID,
        LEGAL_LAST_NAME,
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
        PRE_SCREENING_QUESTIONS,
        PRE_SCREENING_ANSWERS,
        Req_Location,
        JOB_PROFILE,
        SUPERVISORY_ORG,
        ORG_LEVEL,
        IS_EVERGREEN,
        DIVISION,
        SUB_DIVISION,
        DEPARTMENT,
        SUB_DEAPRTMENT,
        Masked_Configuration,
        Masked_Configuration_Override,
        EMPLOYEE_TYPE,
        BENIFIT_CODE,
        Recruiter,
        Recruiter_Employee_ID,
        Recruiter_Workday_ID, 
        Target_Hire_Date_Req, 
        Pay_Transparency_Range_Req, 
        Requisition_Created_Moment ,
        Date_Moved_to_Ready_for_Hire ,
        Worker_Sub_Type_Hiring_Requirement ,
        Job_Requisition_Pay_Company ,
        Rehire ,
        Bonus_Target_Percent_Proposed ,
        One_Time_Payments_Amount_Requested_Proposed ,
        Approved_By_Workers ,
        Comp_Grade ,
        Comp_Grade_Min ,
        Comp_Grade_Mid ,
        Comp_Grade_Max
        --JOBS_APPLIED,-- No data
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
$88

from @worker_load_instg/Job_Applications.csv (file_format => 'csv_load_format') t

select count(*),job_application from PO_WD_APPLICATION_STG group by 2 having count(*) > 1;

select substr(job_requisition,charindex('(',job_requisition,1)+1,1,job_requisition from PO_WD_APPLICATION_STG  ;

select distinct reverse(substr(reverse(job_requisition),charindex(')',reverse(job_requisition),0)+1,charindex('(',reverse(job_requisition),0)-2)) from PO_WD_APPLICATION_STG  ;

where



job_requisition like '%Hire%'
--offer_date is  not null

job_application like    '%JR23-10804%''%Jiawen Wang - JR23-10865 TriStar Pictures Intern – Fall 2023%' ;

%''%Jiawen Wang - JR23-10865 TriStar Pictures Intern – Fall 2023%' ;
10564
10922
--Array size check
select array_size(t.value)
from @worker_load_instg/Job_Applications_Split.json (file_format => 'json_load_format') as S
, table(flatten(S.$1,'')) t


select (App_Json:Application_Date),parse_Json(App_Json:Benefit_Code) from PO_WD_APPLICATION_JSON;



--Array size check
select array_size(t.value)
from @worker_load_instg/Job_Applications_Split.json (file_format => 'json_load_format') as S
, table(flatten(S.$1,'')) t


select (App_Json:Application_Date),parse_Json(App_Json:Benefit_Code) from PO_WD_APPLICATION_JSON;

 --pattern=>'.*data.*[.]csv.gz'




