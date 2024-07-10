CREATE OR REPLACE SCHEMA "PO_HRIS_DB"."ld"
COMMENT = 'learning and development data';


CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_linkedin
(
Employee_Email Varchar(128) not null,
Employee_User_Name Varchar(128) not null,
Effective_date Date not null,
Expiration_date Date not null,
Content_Name Varchar,
Content_Provider Varchar,
Content_Type Varchar,
Content_ID Varchar(32),
Viewed_Hour Number,
Percent_Completed Varchar(5),
Start_Datetime timestamp_ntz,
Last_Visit_Datetime timestamp_ntz,
Completed_Datetime timestamp_ntz,
Total_Assessment Number,
Completed_Assessment Number,
Skill Varchar(200),
Video_Course_Name Varchar,
Video_Course_ID Varchar(10),
Time_Of_Group Varchar(10),
Current_Group Varchar(10),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer

);
create or replace TABLE PO_HRIS_DB."ld".PO_LINKEDIN_LEARNING (
	EMPLOYEE_EMAIL VARCHAR(128) NOT NULL,
	EMPLOYEE_USER_NAME VARCHAR(128) NOT NULL,
	EFFECTIVE_DATE DATE NOT NULL,
	EXPIRATION_DATE DATE NOT NULL,
	CONTENT_NAME VARCHAR(16777216),
	CONTENT_PROVIDER VARCHAR(16777216),
	CONTENT_TYPE VARCHAR(16777216),
	CONTENT_ID VARCHAR(32),
	VIEWED_HOUR NUMBER(38,4),
	PERCENT_COMPLETED VARCHAR(5),
	START_DATETIME TIMESTAMP_NTZ(9),
	LAST_VISIT_DATETIME TIMESTAMP_NTZ(9),
	COMPLETED_DATETIME TIMESTAMP_NTZ(9),
	TOTAL_ASSESSMENT NUMBER(38,0),
	COMPLETED_ASSESSMENT NUMBER(38,0),
	SKILL VARCHAR(200),
	VIDEO_COURSE_NAME VARCHAR(16777216),
	VIDEO_COURSE_ID VARCHAR(10),
	TIME_OF_GROUP VARCHAR(10),
	CURRENT_GROUP VARCHAR(10),
	CREATED_DATE TIMESTAMP_NTZ(9),
	CREATED_BY VARCHAR(100),
	MODIFIED_DATE TIMESTAMP_NTZ(9),
	MODIFEID_BY VARCHAR(100),
	BATCH_ID NUMBER(38,0)
);
CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_cloud_guru
(
Employee_Email Varchar(50),
Content_Title Varchar(100),
Assessment_Pct Varchar(4),
Viewed_Minute Varchar(10),
Last_Visit_Date Date,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
);

CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_hmm
(
Content_Name Varchar(500),
Employee_User_Name Varchar(128),
Employee_Email Varchar(128),
Visit_Count Number(3,0),
//Viewed_Minute Varchar(5),
Assessment_Score Number(3,0),
//Completed_Assessment Number(3,0),
//Assessment_Pct Varchar(10),
//Job1_Status Varchar(10),
//Job2_Status Varchar(10),
Completed_Dt timestamp_ntz,
Region Varchar(20),
Division Varchar(100),
Department Varchar(500),
Source_Filename Varchar(500),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer

);

CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_cbd_nugget
(
Employee_Email Varchar(50),
Category Varchar(50),
Skill Varchar(100),
Completed_Datetime timestamp_ntz,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
);

Kevin	Kavanagh	kevin_kavanagh@spe.sony.com	1:39:28	5	1/31/2024 16:15


CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_corner_stone
(
Employee_User_Name Varchar(20),
work_location Varchar(100),
Division Varchar(100),
Sub_Division Varchar(100),
Content_title Varchar(200),
Content_Category Varchar(50),
Content_Type Varchar(50),
Part_Location Varchar(100),
Content_Language Varchar(10),
Start_Datetime timestamp_ntz,
End_Datetime timestamp_ntz,
Content_Duration Number(3,0),
Training_Status Varchar(50),
Content_Status Varchar(50),
employee_email Varchar(50),
personal_email Varchar(50),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer

);