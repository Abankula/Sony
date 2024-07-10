CREATE SCHEMA "PO_HRIS_DB"."survey"
COMMENT = 'employee survey data';

CREATE SCHEMA "PO_STAGE_DB"."survey"
COMMENT = 'employee survey data';

CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_candidate_survey
(
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Recipient_Email Varchar(100),
External_Reference Varchar(10),
Distribution_Channel Varchar(10),
User_Language Varchar(2),
Job_Requisition Varchar(100),
Candidate_ID Varchar(30),
Req_ID Varchar(10),
Applied_Date Date,
Offer_Date Date,
Q1 Varchar(10),
Q2 Varchar(10),
Q3 Varchar(10),
Q4 Varchar(10),
Q5 Varchar(10),
Q6 Varchar(10),
Q7 Varchar(10),
Q8 Varchar(10),
Q9 Varchar(10),
Q10 Varchar(10),
Q11 Varchar(10),
Q12 Varchar(10),
Q13 Varchar(10),
Q14 Varchar(10),
Q15 Varchar(10),
Q16 Varchar(10),
Q17 Varchar(10),
Q18 Varchar(10),
Q19 Varchar(10),
Q20 Varchar(10),
Q21 Varchar(10),
Q22 Varchar(10),
Q23 Varchar(10),
Q24 Varchar(10),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
);


CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_new_hire_survey
(
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Last_Update_Timestamp timestamp_ntz,
Employee_ID Varchar(32),
Q29 Varchar,
Q2 Varchar,
Q4 Varchar,
Q5 Varchar,
Q6 Varchar,
Q7 Varchar,
Q8 Varchar,
Q9 Varchar,
Q10 Varchar,
Q11 Varchar,
Q12 Varchar,
Q13 Varchar,
Q14 Varchar,
Q15 Varchar,
Q16 Varchar,
Q18 Varchar,
Q20 Varchar,
Q19 Varchar,
Q21 Varchar,
Q22 Varchar,
Q23 Varchar,
Q24 Varchar,
Q25 Varchar,
Q26 Varchar,
Q27 Varchar,
Q28 Varchar,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer

);
CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_anniversary_survey
(
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Anniversary_Date Date,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_ID Varchar(30),
Employee_ID Varchar(32),
Last_Metadata_Update timestamp_ntz,
FY_Quarter Varchar(10),
Fiscal_Year Varchar(10),
eNPS_EMP Number,
eNPS_MOV Number,
eNPS_TV Number,
eNPS_Category Varchar(10),
eNPS_Movie_Category Varchar(10),
eNPS_TV_Category Varchar(10),
Q1 Varchar(30),
Q2 Varchar(30),
Q3 Varchar(30),
Q4 Varchar(30),
Q5 Varchar(30),
Q6 Varchar(30),
Q7 Varchar(30),
Q8 Varchar(30),
Q9 Varchar(30),
Q10 Varchar(30),
Q11 Varchar(30),
Q12 Varchar(30),
Q13 Varchar(30),
Q14 Varchar(30),
Q15 Varchar(30),
Q16 Varchar(30),
Q17 Varchar(30),
Q18 Varchar(30),
Q19 Varchar(30),
Q20 Varchar(30),
Q21 Varchar(30),
Q22 Varchar(30),
Q23 Varchar,
Q24 Varchar(30),
Q25 Varchar(30),
Q26 Varchar(30),
Q27 Varchar(30),
Q28 Varchar(30),
Q29 Varchar(30),
Q30 Varchar(30),
Q31 Varchar(30),
Q32 Varchar(30),
Q33 Varchar(30),
Q34 Varchar(30),
Q35 Varchar(30),
Q36 Varchar(30),
Q37 Varchar(30),
Q38 Varchar(30),
Q39 Varchar(30),
Q40 Varchar(30),
Q41 Varchar(30),
Q42 Varchar(30),
Q43 Varchar(30),
Q44 Varchar(30),
Q45 Varchar(30),
Q46 Varchar(30),
Q47 Varchar(30),
Q48 Varchar(30),
Q49 Varchar,
Q50 Varchar,
Q51 Varchar,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;
create or replace TABLE PO_HRIS_DB."survey".PO_EXIT_SURVEY (
	RECORD_DATE DATE,
	START_DATETIME TIMESTAMP_NTZ(9),
	END_DATETIME TIMESTAMP_NTZ(9),
	STATUS VARCHAR(2),
	PROGRESS NUMBER(38,0),
	DURATION NUMBER(38,0),
	FINISHED BOOLEAN,
	RECORDED_DATE TIMESTAMP_NTZ(9),
	RESPONSE_ID VARCHAR(17),
	TERMINATION_DATE DATE,
	EMPLOYEE_ID VARCHAR(128),
	Q3_374 VARCHAR(40),
	Q3_376 VARCHAR(90),
	Q3_378 VARCHAR(50),
	Q3_388 VARCHAR(30),
	Q3_386 VARCHAR(10),
	Q3_380 VARCHAR(50),
	Q3_381 VARCHAR(40),
	Q3_382 VARCHAR(30),
	Q3_375 VARCHAR(50),
	Q3_377 VARCHAR(70),
	Q3_379 VARCHAR(40),
	Q3_383 VARCHAR(30),
	Q3_384 VARCHAR(30),
	Q3_385 VARCHAR(10),
	Q3_387 VARCHAR(60),
	Q4 VARCHAR(90),
	Q6_4 VARCHAR(110),
	Q6_5 VARCHAR(80),
	Q6_6 VARCHAR(70),
	Q6_7 VARCHAR(80),
	Q6_8 VARCHAR(60),
	Q6_9 VARCHAR(100),
	Q6_10 VARCHAR(80),
	Q6_11 VARCHAR(110),
	Q6_12 VARCHAR(80),
	Q6_13 VARCHAR(80),
	Q6_14 VARCHAR(110),
	Q6_15 VARCHAR(30),
	Q6_15_TEXT VARCHAR(790),
	Q7 VARCHAR(1940),
	Q9_29 VARCHAR(40),
	Q9_30 VARCHAR(50),
	Q9_31 VARCHAR(60),
	Q9_32 VARCHAR(100),
	Q9_33 VARCHAR(30),
	Q9_34 VARCHAR(40),
	Q9_41 VARCHAR(30),
	Q9_35 VARCHAR(30),
	Q9_36 VARCHAR(20),
	Q9_37 VARCHAR(30),
	Q9_38 VARCHAR(40),
	Q9_39 VARCHAR(30),
	Q9_40 VARCHAR(30),
	Q9_41_TEXT VARCHAR(260),
	Q10 VARCHAR(3640),
	Q12_61 VARCHAR(30),
	Q12_62 VARCHAR(50),
	Q12_63 VARCHAR(60),
	Q12_64 VARCHAR(20),
	Q12_65 VARCHAR(60),
	Q12_66 VARCHAR(20),
	Q12_67 VARCHAR(20),
	Q12_68 VARCHAR(30),
	Q12_69 VARCHAR(50),
	Q12_79 VARCHAR(30),
	Q12_70 VARCHAR(30),
	Q12_71 VARCHAR(30),
	Q12_72 VARCHAR(50),
	Q12_73 VARCHAR(100),
	Q12_74 VARCHAR(100),
	Q12_75 VARCHAR(100),
	Q12_76 VARCHAR(100),
	Q12_77 VARCHAR(20),
	Q12_78 VARCHAR(30),
	Q12_79_TEXT VARCHAR(340),
	Q13 VARCHAR(1140),
	Q15_80 VARCHAR(60),
	Q15_81 VARCHAR(90),
	Q15_82 VARCHAR(90),
	Q15_83 VARCHAR(60),
	Q15_88 VARCHAR(30),
	Q15_84 VARCHAR(50),
	Q15_85 VARCHAR(80),
	Q15_86 VARCHAR(100),
	Q15_87 VARCHAR(80),
	Q15_88_TEXT VARCHAR(370),
	Q16 VARCHAR(1460),
	Q18 VARCHAR(1250),
	Q19 VARCHAR(660),
	Q20 VARCHAR(20),
	Q21 VARCHAR(70),
	Q23_4 VARCHAR(60),
	Q23_5 VARCHAR(100),
	Q23_6 VARCHAR(50),
	Q23_7 VARCHAR(30),
	Q23_8 VARCHAR(30),
	Q23_9 VARCHAR(30),
	Q23_10 VARCHAR(20),
	Q23_11 VARCHAR(30),
	Q23_12 VARCHAR(40),
	Q23_13 VARCHAR(30),
	Q23_13_TEXT VARCHAR(210),
	Q24 VARCHAR(1360),
	Q31 VARCHAR(70),
	Q27 VARCHAR(10),
	Q28 VARCHAR(110),
	Q32 VARCHAR(1210),
	Q33_4 VARCHAR(60),
	Q33_5 VARCHAR(60),
	Q33_6 VARCHAR(80),
	Q33_7 VARCHAR(60),
	Q33_8 VARCHAR(70),
	Q33_9 VARCHAR(70),
	Q33_10 VARCHAR(60),
	Q33_11 VARCHAR(60),
	Q33_12 VARCHAR(100),
	Q33_13 VARCHAR(30),
	Q33_13_TEXT VARCHAR(140),
	Q34 VARCHAR(160),
	Q35 VARCHAR(30),
	Q36 VARCHAR(780),
	Q37 VARCHAR(1460),
	Q39_1_A VARCHAR(40),
	Q39_2_A VARCHAR(40),
	Q39_3_A VARCHAR(40),
	Q39_4_A VARCHAR(40),
	Q39_5_A VARCHAR(40),
	Q39_6_A VARCHAR(40),
	Q39_7_A VARCHAR(40),
	Q39_8_A VARCHAR(40),
	Q39_1_B VARCHAR(20),
	Q39_2_B VARCHAR(20),
	Q39_3_B VARCHAR(20),
	Q39_4_B VARCHAR(20),
	Q39_5_B VARCHAR(20),
	Q39_6_B VARCHAR(20),
	Q39_7_B VARCHAR(20),
	Q39_8_B VARCHAR(20),
	Q39_9_A VARCHAR(40),
	Q39_10_A VARCHAR(40),
	Q39_11_A VARCHAR(40),
	Q39_12_A VARCHAR(40),
	Q39_13_A VARCHAR(40),
	Q39_14_A VARCHAR(40),
	Q39_15_A VARCHAR(40),
	Q39_16_A VARCHAR(40),
	Q39_9_B VARCHAR(20),
	Q39_10_B VARCHAR(20),
	Q39_11_B VARCHAR(20),
	Q39_12_B VARCHAR(20),
	Q39_13_B VARCHAR(20),
	Q39_14_B VARCHAR(20),
	Q39_15_B VARCHAR(20),
	Q39_16_B VARCHAR(20),
	Q39_17_A VARCHAR(40),
	Q39_18_A VARCHAR(40),
	Q39_19_A VARCHAR(40),
	Q39_20_A VARCHAR(40),
	Q39_21_A VARCHAR(40),
	Q39_22_A VARCHAR(40),
	Q39_23_A VARCHAR(40),
	Q40_24_A VARCHAR(40),
	Q39_17_B VARCHAR(20),
	Q39_18_B VARCHAR(20),
	Q39_19_B VARCHAR(20),
	Q39_20_B VARCHAR(20),
	Q39_21_B VARCHAR(20),
	Q39_22_B VARCHAR(20),
	Q39_23_B VARCHAR(20),
	Q40_24_B VARCHAR(20),
	Q39_25_A VARCHAR(40),
	Q39_26_A VARCHAR(40),
	Q39_27_A VARCHAR(40),
	Q39_28_A VARCHAR(40),
	Q39_29_A VARCHAR(40),
	Q39_30_A VARCHAR(40),
	Q39_31_A VARCHAR(40),
	Q43_44_A VARCHAR(40),
	Q39_25_B VARCHAR(20),
	Q39_26_B VARCHAR(20),
	Q39_27_B VARCHAR(20),
	Q39_28_B VARCHAR(20),
	Q39_29_B VARCHAR(20),
	Q39_30_B VARCHAR(20),
	Q39_31_B VARCHAR(20),
	Q43_44_B VARCHAR(20),
	Q44 VARCHAR(50),
	SOURCE_FILENAME VARCHAR(100),
	CREATED_DATETIME TIMESTAMP_NTZ(9),
	CREATED_BY VARCHAR(100),
	MODIFIED_DATETIME TIMESTAMP_NTZ(9),
	MODIFIED_BY VARCHAR(100),
	BATCH_ID NUMBER(38,0)
);

CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_decline_survey
(
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Distribution_Channel Varchar(10),
User_Language Varchar(2),
Participant_Email Varchar(100),
Q1 Varchar(500),
Q2 Varchar,
Q3 Varchar(200),
Q4 Varchar,
Q5 Varchar,
Q6 Varchar(10),
Q7 Varchar(100),
Q8_NPS_Category Varchar(10),
Q9_eNPS Number,
Q10 Varchar(10),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;
CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_14day_survey
(
Start_Date timestamp_ntz,
End_Date timestamp_ntz,
Status Varchar(10),
Progress Number,
Duration Number,
Finished Boolean,
Recorded_Date timestamp_ntz,
Response_Id Varchar(30),
Employee_ID Varchar(32),
Last_Update_Timestamp timestamp_ntz,
Q1 Varchar,
Q2 Varchar,
Q3 Varchar,
Q4 Varchar,
Q5 Varchar,
Q6 Varchar,
Q7 Varchar,
Q8 Varchar,
Q9 Varchar,
Q10 Varchar,
Q11 Varchar,
Q12 Varchar,
Q13 Varchar,
Q14 Varchar,
Q15 Varchar,
Q16 Varchar,
Q17 Varchar,
Q18 Varchar,
Q19 Varchar,
Q20 Varchar,
Q21 Varchar,
Q22 Varchar,
Q23 Varchar,
Q24 Varchar,
Q25 Varchar,
Q26 Varchar,
Q27 Varchar,
Q28 Varchar,
Q29 Varchar,
Q30 Varchar,
Q31 Varchar,
Q32 Varchar,
Q33 Varchar,
Q34 Varchar,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
);


CREATE OR REPLACE TABLE "PO_HRIS_DB"."survey".po_survey_reference
(
Survey_Name Varchar(100),
Questions Varchar(10),
Description Varchar,
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer

);
//select description from "PO_HRIS_DB"."survey".po_survey_reference where Survey_Name = 'NewHire' and Questions = 'Q2'

Insert Into po_survey_reference values('NewHire','Q2','SPE demonstrates care and concern for me as an employee.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q4','I feel that my opinions and thoughts matter at SPE.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q5','SPE provides the tools and resources needed for me to be effective at my job.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q6','There are no substantial obstacles [e.g., bureaucracy, waste, unnecessary rules, etc.] at work to doing my job well.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q7','I know where to go to request additional IT access and assets to do my job.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q8','To help us improve the process, do you have any ideas/suggestions for requesting IT assets and systems?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q9','My direct manager provides clear and regular feedback on my performance.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q10','I would recommend my managers to others.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q11','I understand what is expected of me to be successful at my job.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q12','My talents and strengths are fully utilized in performing my job.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q13','I intend to be working at SPE for a long time.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q14','I am fitting in well within SPE culture.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q15','I feel that my work contributes to the overall success of SPE.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q16','I feel that I am well integrated within my team.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q18','Workingat SPE gives me opportunity to grow and develop my career.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q20','I am receiving on the job training that is necessary for me to be effective at my job.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q19','What training are you missing in order for you to be effective at your job? Please explain.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q21','My position is meeting the job expectations I had prior to starting at SPE.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q22','In what ways has your job been different from expected?  Please explain.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q23','Overall,how satisfied were you with your onboarding experience at SPE?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q24','How likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends or colleagues?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q25','How likely would you recommend Sony Pictures Entertainment movies to your family, friends or colleagues?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q26','How likely would you recommend Sony Pictures Entertainment television shows to your family, friends or colleagues?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q27','During the past 3 months, what has worked well in helping you transition into SPE?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('NewHire','Q28','During the past 3 months, what could we have done differently to help you transition into SPE?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);


--14 day

Insert Into po_survey_reference values('14Day_NewHire','Q8','I received clear information that prepared me for my first day (e.g. what to expect, where to go, what to bring, etc.)',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q10','What information could we have provided that would have helped you feel better prepared for your first day?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q12','How would you rate your first day at Sony Pictures Entertainment?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q9','On my first day, my workspace was organized,ready and had everything I needed to begin working.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q13','What was missing from your workspace that you needed?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_1','On my first day, I had the following available to me. - Computer (PC or Laptop)',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_2','On my first day, I had the following available to me. - IDM Password (password you use to access your computer)',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_3','On my first day, I had the following available to me. - Employee Badge',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_4','On my first day, I had the following available to me. - Email Access',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_5','On my first day, I had the following available to me. - Desk Phone',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_6','On my first day, I had the following available to me. - Mobile Phone',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_7','On my first day, I had the following available to me. - Other (Please Specify)',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q14_7_TEXT','On my first day, I had the following available to me. - Other (Please Specify) - Text',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q15','On day one, I was given clear instructions on how to contact the IT Help Desk.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q16','I know where to go to request additional IT access and assets necessary to do my job.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q17','To help us improve the process, do you have any ideas/suggestions for requesting IT assets and systems?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q20','My direct manager made me feel welcome to the team.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q21','My co-workers made me feel welcome to the team.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q22','My team has helped me get acclimated into my new position.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q23','I understand what is
expected of me to be successful in my job',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q25','SPE provides the tools and resources needed for
me to be effective at my job',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q27','I believe that I will be a good fit within SPEâ€™s
culture.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q28','My job is turning out to be as I expected.',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q29','In what ways has your job been different from expected?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q30','Did you attend New
Hire Orientation?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q31','What aspect of the
orientation did you feel was the most helpful?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q32','What information (if
any) was missing or not properly covered during your orientation that would
have been helpful?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q34','Thus far, how satisfied are you with your onboarding
experience at SPE?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q33','During the past two weeks, what has worked well in helping you transition into SPE?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q35','During the past two
weeks, what could we have done differently to better help you transition into
SPE?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q38','How likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends or colleagues?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q40','How likely would you recommend Sony Pictures Entertainment movies to your family, friends or colleagues?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);
Insert Into po_survey_reference values('14Day_NewHire','Q42','How likely would you recommend Sony Pictures Entertainment television shows to your family, friends or colleagues?',Current_timestamp,Current_user,Current_Timestamp,Current_User,20240201);

