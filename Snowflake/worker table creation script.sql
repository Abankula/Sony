CREATE OR REPLACE TABLE "PO_STAGE_DB"."Worker".PO_WD_Worker_Stage
(
Employee_ID Varchar(1000),
Workday_ID Varchar(1000),
Region Varchar(1000),
Work_Country Varchar(1000),
Work_City Varchar(1000),
Job_Code Varchar(1000),
Job_Title Varchar(1000),
Business_Title Varchar(1000),
Time_Type Varchar(1000),
Pay_Rate_Type  Varchar(1000),
FTE_Percent Varchar(1000),
exempt Varchar(1000),
Management_Level Varchar(1000),
Org_Level Varchar(1000),
Benefit_Code Varchar(1000),
Union_Local_Name Varchar(1000),
Union_Code Varchar(1000),
Business_Unit Varchar(1000),
Division_Name Varchar(1000),
Division_Name_ID Varchar(1000),
Sub_Division_Name Varchar(1000),
Sub_Division_ID Varchar(1000),
Department_Name Varchar(1000),
Department_ID Varchar(1000),
Sub_Department_Name Varchar(1000),
Sub_Department_ID Varchar(1000),
Is_Active Varchar(1000),
Contingent_Worker Varchar(1000),
On_Leave Varchar(1000),
Employee_Type Varchar(1000),
Supervisory_Job_Title Varchar(1000),
Employee_Email Varchar(1000),
Continuos_Service_Date Varchar(1000),
Hire_Date Varchar(1000),
Actual_Hire_Date Varchar(1000),
Termination_Date Varchar(1000),
Frequency Varchar(1000),
Salary_Grade Varchar(1000),
Last_Increase_Date Varchar(1000),
Last_Increase_Amount_US Varchar(1000),
Work_State Varchar(1000),
Supervisory_Org Varchar(1000),
Supervisory_Org_ID Varchar(1000)


);


CREATE OR REPLACE TABLE "PO_HRIS_DB"."Worker".PO_WD_JOB
(
Workday_ID Char(32),
Effective_Date Date,
Expiration_Date Date,
Job_Code Char(32),
Job_Code_Title   Varchar(200),
Business_Title   Varchar(200),
Family_Function   Varchar(200),
Time_Type   Varchar(20),
Pay_Rate_Type   Varchar(20),
Frequency   Varchar(40),
Exempt  Boolean,
Generation   Varchar(500),
On_Leave  Boolean,
Union_Code  Varchar(70),
Union_Local_Name Varchar(10),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)

;

CREATE OR REPLACE TABLE "PO_HRIS_DB"."Worker".PO_WD_ORGANIZATION
(
Workday_ID Char(32), 
Effective_Date Date,
Expiration_Date  Date, 
Supervisory_Org_ID  Char(32),
Supervisory_Org  Varchar(100),
Supervisor  Varchar(100), 
Supervisor_Job_Title Varchar(100), 
Supervisor_Work_Email Char(32),
Org_Level Char(2),
Management_Level  Varchar(200),
Span_of_Control  Varchar(100),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;

CREATE OR REPLACE TABLE "PO_HRIS_DB"."Worker".PO_WD_EMPLOYEE
(
  Workday_ID Char(32),
  Effective_Date Date,
  Expiration_Date Date,
  Department_ID Varchar(10),
  Sub_Department_ID Varchar(10),
  Division_ID Varchar(10),
  Sub_Division_ID Varchar(10),
  Business_Unit Varchar(100),
  Division Varchar(100),
  Sub_Division Varchar(100),
  Department Varchar(100),
  Is_Active Boolean,
  Benefit_Code Char(3),
  Hire_Date Date,
  Actual_Hire_Date Date,
  Continuos_Service_Date Date,
  Tenure Integer,
  Employment_End_Date Date,
  Contingent_Worker Boolean,
  Contingent_Worker_Type  Varchar(100),--y
  Termination_Date Date,
  Region Varchar(10),
  Territory Varchar(50),--y
  Work_City Varchar(50), 
  Work_State Varchar(20),
  Work_Zip_Code Varchar(10),--y
  Work_Country  Varchar(100),
  Employee_Type Varchar(100),--Add
  Created_Date timestamp_ntz,
  Created_By Varchar(100),
  Modified_Date timestamp_ntz,
  Modifeid_By Varchar(100),
  Batch_ID Integer
--  Test number(3,0)
)
;
CREATE OR REPLACE TABLE "PO_HRIS_DB"."Worker".PO_WD_COMPENSATION
(
Workday_ID Char(32),
Effective_Date Date,
Expiration_Date Date,
Hourly_Amount Varchar(10),
Currency Varchar(10),--y
Annual_Rate_US Number,--y
Bonus_Plan Varchar(10),--y
Bonus_Amount Number,--y
Bonus_Amount_US Number,--y
Cash_Compensation_US Varchar(10),--Y Total Cash Compensation US
Last_Increase_Date Date,
Last_Increase_Amount_US Number,
Last_Increase_Percent char(4),--y
Target_Percent char(4),--y
FTE_Percent char(4),
Last_Bonus_Date Date,
LTIP_Bonus_Amount Number,
Cost_Center Varchar(100),
Cost_Center_Name Varchar(100),
Cost_Element_Superior Varchar(100),
Cost_Element_Superior_ID Varchar(10),
Salary_Grade  Varchar(100),
Created_Date timestamp_ntz,
Created_By Varchar(100),
Modified_Date timestamp_ntz,
Modifeid_By Varchar(100),
Batch_ID Integer
)
;
CREATE OR REPLACE TABLE "PO_HRIS_DB"."Worker".PO_WD_EE_CONFIDENTIAL
(
  Workday_ID Char(32),
  Employee_ID Char(32),
  Effective_Date Date,
  Expiration_Date Date,
  Age Char(3),
  Gender Varchar(20),
  Origin Varchar(100),--hispanic
  Race Varchar(100),
  Veteran_Status Boolean,
  Disability Boolean,
  Base_Pay_range Number,
  Employee_Work_Email Char(32),  
  Created_Date timestamp_ntz,
  Created_By Varchar(100),
  Modified_Date timestamp_ntz,
  Modifeid_By Varchar(100),
  Batch_ID Integer
)
;