PO_STAGE_DB
Use warehouse PO_WH;
Use Role SYSADMIN;
/*
CREATE OR REPLACE DATABASE PO_HRIS_DB COMMENT = 'A Database to store employee or candidate history data';

CREATE OR REPLACE SCHEMA "PO_HRIS_DB"."Application"
COMMENT = 'Candidate Application Info';

ALTER DATABASE  IF EXISTS  PO_HRIS_DB SET  DATA_RETENTION_TIME_IN_DAYS = 7 

CREATE OR REPLACE SCHEMA "PO_HRIS_DB"."Calender"
COMMENT = 'Calender Info';
*/
;

select 
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
$101 
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/WD_Job_Applications_202211_202302_20231208_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format_skip ) t limit 10;

CREATE OR REPLACE TABLE  "PO_HRIS_DB"."Application".PO_WD_Application
(    
     --Application
     Job_Application Varchar(200) NOT NULL
    ,Source_Application_ID Varchar(30) NOT NULL
    ,Appplication_ID Varchar(30) NOT NULL --Derived field
    ,Is_Hired Boolean NOT NULL
    ,Effective_Date Date NOT NULL
    ,Expiration_Date Date NOT NULL
    ,Application_Date Date NOT NULL
    ,Req_Change_Date Date NOT NULL
    ,Job_Application_Location Varchar(100) NOT NULL
    ,Candidate Varchar(200) -- Similiar data as Job Application field
    ,Candidate_Phone_Number Varchar(20) NOT NULL
    ,Candidate_Email Varchar(100) NOT NULL
    ,Jobs_Applied Varchar(100)
    ,Open_Date Date NOT NULL
    ,OFFER_DATE DATE
    ,Fill_Date Date
    ,Close_Date Date
    ,Freeze_Date Date
    ,Unfreeze_Date Date 
    ,Ready_To_Hire_Date Date
 
    ,Position_Source Varchar(100) NOT NULL
    ,Job_Requisition Varchar(200)
    ,Req_Country Varchar(100)
    ,Last_Recruiting_Stage Varchar(10)
    ,Last_Recruiting_Stage_Date timestamp_ntz
    ,Offer_Date Date
    ,Offer_Status Varchar(10)
    ,Pre_Screening_Answers Varchar(500)
     --Job Req

    ,Duplicate_Application Varchar(500)
    ,Internal Varchar(10)
    ,Referral Varchar(10)
    ,Referred_By Varchar(100)
    ,Referred_Emp_ID Varchar(50)
    --Offer Event
    ,Offer_Base_Pay_Amount Varchar(10)
    ,Offer_Weekly_Hours Varchar(10)
    ,Offer_Job_Profile Varchar(100)
    ,Offer_Location Varchar(100)
    ,Offer_Manager Varchar(100)
    ,Target_Hire_Date Date
    --Tracking fields
    ,Created_Datetime timestamp_ntz NOT NULL
    ,Modified_Datetime timestamp_ntz NOT NULL
    ,Created_By Varchar(100) NOT NULL
    ,Modified_By Varchar(100) NOT NULL
    ,Batch_ID integer NOT NULL

    )
;

CREATE OR REPLACE TABLE  delete from "PO_HRIS_DB"."Application".PO_WD_REQUISITION

( 
   
    Requisition_ID Varchar(20)
    ,Job_Requisition Varchar(200)
    ,Requisition_Status Varchar(10)
    ,Requisition_Created_Moment timestamp_ntz
    ,Open_Dt Date NOT NULL
    ,Fill_Dt Date
    ,Hire_Dt Date
    ,Close_Dt Date
    ,Freeze_Dt Date
    ,Unfreeze_Dt Date 
    ,Ready_To_Hire_Dt Date
    ,Offer_Dt DATE
    ,Target_Req_Dt DATE
    ,Target_Offer_Dt DATE
    ,Hiring_Manager char(128) NOT NULL
    ,Requisition_Country Varchar(100) 
    ,Recruiter char(128)
    ,Recruiter_Emp_ID char(128)
    ,Job_Profile Varchar(100)
    ,Supervisory_Org Varchar(30)
    ,Req_Location Varchar(100)
    ,Org_Level Varchar(100)
    ,Division Varchar(100)
    ,Sub_Division Varchar(100)
    ,Department Varchar(100)
    ,Sub_Department Varchar(100)
    ,Employee_Type Varchar(100)
    ,Benifit_Code Varchar(100)
    ,Comp_Grade Varchar(100)
    ,Comp_Grade_Min Varchar(10)
    ,Comp_Grade_Mid Varchar(10)
    ,Comp_Grade_Max Varchar(10)
    ,Pay_Company Varchar(100)
    ,Pay_Transparency_Range Varchar
    ,Unique_Candidate Number
    ,Hired Number
    ,Total_Application Number
    ,Source_Filename Varchar(100)
    ,Created_Datetime timestamp_ntz NOT NULL
    ,Modified_Datetime timestamp_ntz NOT NULL
    ,Created_By Varchar(100) NOT NULL
    ,Modified_By Varchar(100) NOT NULL
    ,Batch_ID integer NOT NULL
)

;
   

    
--test

CREATE OR REPLACE TABLE  "PO_HRIS_DB"."Application".PO_WD_Application
(    
     --Application
     Job_Application Varchar(200) 
    ,Application_ID Varchar(100) 
    ,Candidate_ID Varchar(100) 
    ,Source_Category Varchar(30)
    ,Is_Hired Boolean 
    ,Application_Date Date 
    ,Req_Change_Date Date 
    ,Job_Application_Location Varchar(100) 
    ,Position_Source Varchar(100) 
    ,Last_Recruiting_Stage Varchar(50)
    ,Last_Recruiting_Step Varchar(500)
    ,Last_Recruiting_Stage_Date timestamp_ntz
    ,Offer_Date Date
    ,Offer_Status Varchar(500)
    ,Duplicate_Application Varchar(500)
    ,DISPOSITION_REASON Varchar(500)
    ,Internal Varchar(10)
    ,Referral Varchar(50)
    ,Referred_By Varchar(100)
    ,Referred_Emp_ID Varchar(50)
    ,Offer_Base_Pay_Amount Varchar(10)
    ,Offer_Weekly_Hours Varchar(10)
    ,Offer_Job_Profile Varchar(100)
    ,Offer_Location Varchar(100)
    ,Offer_Manager Varchar(100)
    ,Target_Hire_Date Date
    ,Hire_Date Date
    ,Created_Datetime timestamp_ntz 
    ,Modified_Datetime timestamp_ntz 
    ,Created_By Varchar(100) 
    ,Modified_By Varchar(100) 
    ,Batch_ID integer 

    )
;      
   





