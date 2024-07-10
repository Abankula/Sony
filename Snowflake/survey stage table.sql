CREATE OR REPLACE SCHEMA "PO_STAGE_DB"."survey"
COMMENT = 'employee survey data';

CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_candidate_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Status Varchar(10),
Progress Varchar(30),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
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
Q24 Varchar(10)
);


CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_new_hire_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Status Varchar(10),
Progress Varchar(30),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
Response_Id Varchar(30),
Last_Update_Timestamp Varchar(30),
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
Q28 Varchar
);


CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_anniversary_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Anniversary_Date Varchar(30),
Status Varchar(10),
Progress Varchar(30),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
Response_ID Varchar(30),
Employee_ID Varchar(32),
Last_Metadata_Update Varchar(30),
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
Q51 Varchar
)
;
create or replace TABLE PO_STAGE_DB."survey".PO_EXIT_SURVEY_STAGE (
	START_DATE VARCHAR(20),
	END_DATE VARCHAR(20),
	STATUS VARCHAR(10),
	PROGRESS VARCHAR(10),
	DURATION VARCHAR(10),
	FINISHED VARCHAR(10),
	RECORDED_DATE VARCHAR(20),
	RESPONSE_ID VARCHAR(20),
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
	TERMINATION_DATE VARCHAR(10),
	EMPLOYEE_ID VARCHAR(128),
	PARTICIPANT_UNIQUE_IDENTIFIER VARCHAR(128),
	FILENAME VARCHAR(100)
);

CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_decline_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Status Varchar(10),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
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
Q10 Varchar(10)
)
;
CREATE OR REPLACE TABLE "PO_STAGE_DB"."survey".po_new_hire_14day_survey_stage
(
Start_Date Varchar(30),
End_Date Varchar(30),
Status Varchar(10),
Progress Varchar(30),
Duration Varchar(30),
Finished Varchar(30),
Recorded_Date Varchar(30),
Response_Id Varchar(30),
Q6 Varchar,
Q8 Varchar(20),
Q10 Varchar,
Q12 Varchar(20),
Q9 Varchar(20),
Q13 Varchar,
Q14_1 Varchar(20),
Q14_2 Varchar(20),
Q14_3 Varchar(20),
Q14_4 Varchar(20),
Q14_5 Varchar(20),
Q14_6 Varchar(20),
Q14_7 Varchar(20),
Q14_7_TEXT Varchar,
Q15 Varchar(20),
Q16 Varchar(20),
Q17 Varchar(20),
Q20 Varchar(20),
Q21 Varchar(20),
Q22 Varchar(20),
Q23 Varchar(20),
Q25 Varchar(20),
Q27 Varchar(20),
Q28 Varchar(20),
Q29 Varchar,
Q30 Varchar(20),
Q31 Varchar,
Q32 Varchar,
Q34 Varchar(20),
Q33 Varchar,
Q35 Varchar,
Q38 Varchar(20),
Q40 Varchar(20),
Q42 Varchar(20),
Employee_ID Varchar(128),
Last_Update_Timestamp Varchar(30),
);