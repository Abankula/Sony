
create or replace view vw_day90_new_hire_survey as
select 
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
Q2 as "SPE demonstrates care and concern for me as an employee.",
Q4 as "I feel that my opinions and thoughts matter at SPE.",
Q5 as "SPE provides the tools and resources needed for me to be effective at my job.",
Q6 as "There are no substantial obstacles [e.g., bureaucracy, waste, unnecessary rules, etc.] at work to doing my job well.",
Q7 as "I know where to go to request additional IT access and assets to do my job.",
Q8 as "To help us improve the process, do you have any ideas/suggestions for requesting IT assets and systems?",
Q9 as "My direct manager provides clear and regular feedback on my performance.",
Q10 as "I would recommend my managers to others.",
Q11 as "I understand what is expected of me to be successful at my job.",
Q12 as "My talents and strengths are fully utilized in performing my job.",
Q13 as "I intend to be working at SPE for a long time.",
Q14 as "I am fitting in well within SPE culture.",
Q15 as "I feel that my work contributes to the overall success of SPE.",
Q16 as "I feel that I am well integrated within my team.",
Q18 as "Working
at SPE gives me opportunity to grow and develop my career.",
Q20 as "I am receiving on the job training that is necessary for me to be effective at my job.",
Q19 as "What training are you missing in order for you to be effective at your job? Please explain.",
Q21 as "My position is meeting the job expectations I had prior to starting at SPE.",
Q22 as "In what ways has your job been different from expected?  Please explain.",
Q23 as "Overall,how satisfied were you with your onboarding experience at SPE?",
Q24 as "How likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends or colleagues?",
Q25 as "How likely would you recommend Sony Pictures Entertainment movies to your family, friends or colleagues?",
Q26 as "How likely would you recommend Sony Pictures Entertainment television shows to your family, friends or colleagues?",
Q27 as "During the past 3 months, what has worked well in helping you transition into SPE?",
Q28 as "During the past 3 months, what could we have done differently to help you transition into SPE?",
Employee_ID,
Hire_Date
from PO_HRIS_DB."survey".PO_NEW_HIRE_SURVEY;

select distinct region from TABLEAU."survey".VW_EXIT_SURVEY

create or replace view TABLEAU."survey".VW_EXIT_SURVEY as
	select Record_Date,
    Start_Datetime,
    End_Datetime,
    Status,
    Progress,
    Duration,
    Finished,
    Recorded_Date,
    Response_Id,
    Termination_Date,
   coalesce(Term_Dt_Snapshot,Termination_Date) as Term_Dt_Snapshot,
    Employee_ID,
    Response,
 SPE_Business_Unit  ,
SPE_Division  ,
SPE_Sub_Division  ,
SPE_Dept  ,
SPE_Sub_Dept  ,
Benefit_Code  ,
Org_Level  ,
Management_Level  ,
Hire_Dt  ,
Original_Hire_Dt  ,
Continuous_Service_Dt  ,
null as Time_in_Job  ,
Job_Code  ,
Job_Title  ,
Job_Family_Func  ,
Job_Family_Grp  ,
Job_Family  ,
Business_Title  ,
Exempt  ,
FTE   ,
Time_Type  ,
Pay_Rate_Type  ,
Pay_Frequency  ,
Hourly_Rate  ,
Hourly_Rate_Currency  ,
Annual_Base_Pay  ,
Annual_Base_Currency  ,
Annual_Base_Pay_US  ,
Aspire_Target_Percentage  ,
Aspire_Bonus_Plan  ,
Aspire_Bonus  ,
Aspire_Bonus_Currency  ,
Aspire_Bonus_Plan_US  ,
Supervisory_Org  ,
 HIERARCHY_L1,
	HIERARCHY_L2,
	HIERARCHY_L3,
	HIERARCHY_L4,
HIERARCHY_L5,
 HIERARCHY_L6,
HIERARCHY_L7,
	HIERARCHY_L8,
 HIERARCHY_L9,
 HIERARCHY_L10,
Manager_Job_Title  ,
Employee_Type  ,
End_Employment_Dt  ,
Contingent_Worker  ,
Contingent_Worker_Type  ,
Union_Local_Code  ,
Union_Local_Name  ,
Region  ,
Work_City  ,
Work_State  ,
Work_Postal_Code  ,
Work_Country  ,
Dept_ID  ,
Gender  ,
Age  ,
Hispanic_Latino  ,
Race_Ethnicity  ,
Veteran  ,
Disability,
Work_Location  ,
case when termination_reason like '%Voluntary%' then True else False end as Is_Voluntary_FG  ,
Business_Partner  ,
Job_Description  ,
Termination_Dt_all,
Termination_Reason,
Is_Rehire, er.long_description as Question_Full_Text,
    er.description as Question,
    case when er.category is null 
    then 'Multiple Choice' Else er.category end as category
    from
    (SELECT 
    *
     FROM  
    (
SELECT 
    w.workday_id,
    w.snapshot_dt,
    a.Record_Date,
    a.Start_Datetime,
    a.End_Datetime,
    a.Status,
    a.Progress,
    a.Duration,
    a.Finished,
    a.Recorded_Date,
    a.Response_Id,
    a.Termination_Date,
    a.Employee_ID,
 w.Termination_dt as Term_Dt_Snapshot,
 w.SPE_Business_Unit  ,
w.SPE_Division  ,
w.SPE_Sub_Division  ,
w.SPE_Dept  ,
w.SPE_Sub_Dept  ,
w.Benefit_Code  ,
w.Org_Level  ,
w.Management_Level  ,
w.Hire_Dt  ,
w.Original_Hire_Dt  ,
w.Continuous_Service_Dt  ,
null as Time_in_Job  ,
w.Job_Code  ,
w.Job_Title  ,
w.Job_Family_Func  ,
w.Job_Family_Grp  ,
w.Job_Family  ,
w.Business_Title  ,
w.Exempt  ,
w.FTE   ,
w.Time_Type  ,
w.Pay_Rate_Type  ,
w.Pay_Frequency  ,
w.Hourly_Rate  ,
w.Hourly_Rate_Currency  ,
w.Annual_Base_Pay  ,
w.Annual_Base_Currency  ,
w.Annual_Base_Pay_US  ,
w.Aspire_Target_Percentage  ,
w.Aspire_Bonus_Plan  ,
w.Aspire_Bonus  ,
w.Aspire_Bonus_Currency  ,
w.Aspire_Bonus_Plan_US  ,
w.Supervisory_Org  ,
w.HIERARCHY_1 as HIERARCHY_L1,
	w.HIERARCHY_2 as HIERARCHY_L2,
	w.HIERARCHY_3 as HIERARCHY_L3,
	w.HIERARCHY_4 as HIERARCHY_L4,
	w.HIERARCHY_5 as HIERARCHY_L5,
	w.HIERARCHY_6 as  HIERARCHY_L6,
	w.HIERARCHY_7 as HIERARCHY_L7,
	w.HIERARCHY_8 as HIERARCHY_L8,
	w.HIERARCHY_9 as HIERARCHY_L9,
	w.HIERARCHY_10 as HIERARCHY_L10,
w.Manager_Job_Title  ,
w.Employee_Type  ,
w.End_Employment_Dt  ,
w.Contingent_Worker  ,
w.Contingent_Worker_Type  ,
w.Union_Local_Code  ,
w.Union_Local_Name  ,
w.Region  ,
w.Work_City  ,
w.Work_State  ,
w.Work_Postal_Code  ,
w.Work_Country  ,
w.Dept_ID  ,
w.Gender  ,
w.Age  ,
w.Hispanic_Latino  ,
w.Race_Ethnicity  ,
w.Vetaran as Veteran  ,
w.Disbaility as Disability,
w.Work_Location  ,
w.Is_Voluntary_FG  ,
w.Business_Partner  ,
w.Job_Description  ,
replace(ifnull((case when w.Termination_Reason like '%Conversion%' then 'Terminate Employee > Voluntary > Resignation' else w.Termination_Reason end),l.Termination_Reason),' ','') as Termination_Reason,
w.Termination_Dt_all,
w.Is_Rehire,
Q3_374, Q3_376, Q3_378, Q3_388, Q3_386, Q3_380, Q3_381, Q3_382, Q3_375, Q3_377, Q3_379, Q3_383, Q3_384, Q3_385, Q3_387, Q4, Q6_4, Q6_5, Q6_6, Q6_7, Q6_8, Q6_9, Q6_10, Q6_11, Q6_12, Q6_13, Q6_14, Q6_15, Q6_15_TEXT, Q7, Q9_29, Q9_30, Q9_31, Q9_32, Q9_33, Q9_34, Q9_41, Q9_35, Q9_36, Q9_37, Q9_38, Q9_39, Q9_40, Q9_41_TEXT, Q10, Q12_61, Q12_62, Q12_63, Q12_64, Q12_65, Q12_66, Q12_67, Q12_68, Q12_69, Q12_79, Q12_70, Q12_71, Q12_72, Q12_73, Q12_74, Q12_75, Q12_76, Q12_77, Q12_78, Q12_79_TEXT, Q13, Q15_80, Q15_81, Q15_82, Q15_83, Q15_88, Q15_84, Q15_85, Q15_86, Q15_87, Q15_88_TEXT, Q16, Q18, Q19, Q20, Q21, Q23_4, Q23_5, Q23_6, Q23_7, Q23_8, Q23_9, Q23_10, Q23_11, Q23_12, Q23_13, Q23_13_TEXT, Q24, Q31, Q27, Q28, Q32, Q33_4, Q33_5, Q33_6, Q33_7, Q33_8, Q33_9, Q33_10, Q33_11, Q33_12, Q33_13, Q33_13_TEXT, Q34, Q35, Q36, Q37, Q39_1_A, Q39_2_A, Q39_3_A, Q39_4_A, Q39_5_A, Q39_6_A, Q39_7_A, Q39_8_A, Q39_1_B, Q39_2_B, Q39_3_B, Q39_4_B, Q39_5_B, Q39_6_B, Q39_7_B, Q39_8_B, Q39_9_A, Q39_10_A, Q39_11_A, Q39_12_A, Q39_13_A, Q39_14_A, Q39_15_A, Q39_16_A, Q39_9_B, Q39_10_B, Q39_11_B, Q39_12_B, Q39_13_B, Q39_14_B, Q39_15_B, Q39_16_B, Q39_17_A, Q39_18_A, Q39_19_A, Q39_20_A, Q39_21_A, Q39_22_A, Q39_23_A, Q40_24_A, Q39_17_B, Q39_18_B, Q39_19_B, Q39_20_B, Q39_21_B, Q39_22_B, Q39_23_B, Q40_24_B, Q39_25_A, Q39_26_A, Q39_27_A, Q39_28_A, Q39_29_A, Q39_30_A, Q39_31_A, Q43_44_A, Q39_25_B, Q39_26_B, Q39_27_B, Q39_28_B, Q39_29_B, Q39_30_B, Q39_31_B, Q43_44_B, Q44
FROM "PO_HRIS_DB"."survey".po_exit_survey a
LEFT JOIN (select * from(Select *,row_number() over (partition by employee_id order by snapshot_dt desc) rk from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT
where active_status = 'False' 
)c where c.rk =1 )w on w.employee_id = a.employee_id 
left join (select employee_id,b.termination_reason from PO_STAGE_DB."Worker".PO_WORKER_SNAPSHOT_20231203 b where snapshot_dt = '2023-10-31') l on l.employee_id = a.employee_id 
)
UNPIVOT (
            Response FOR Question IN (
                Q3_374, Q3_376, Q3_378, Q3_388, Q3_386, Q3_380, Q3_381, Q3_382, Q3_375, Q3_377, Q3_379, Q3_383, Q3_384, Q3_385, Q3_387, Q4, Q6_4, Q6_5, Q6_6, Q6_7, Q6_8, Q6_9, Q6_10, Q6_11, Q6_12, Q6_13, Q6_14, Q6_15, Q6_15_TEXT, Q7, Q9_29, Q9_30, Q9_31, Q9_32, Q9_33, Q9_34, Q9_41, Q9_35, Q9_36, Q9_37, Q9_38, Q9_39, Q9_40, Q9_41_TEXT, Q10, Q12_61, Q12_62, Q12_63, Q12_64, Q12_65, Q12_66, Q12_67, Q12_68, Q12_69, Q12_79, Q12_70, Q12_71, Q12_72, Q12_73, Q12_74, Q12_75, Q12_76, Q12_77, Q12_78, Q12_79_TEXT, Q13, Q15_80, Q15_81, Q15_82, Q15_83, Q15_88, Q15_84, Q15_85, Q15_86, Q15_87, Q15_88_TEXT, Q16, Q18, Q19, Q20, Q21, Q23_4, Q23_5, Q23_6, Q23_7, Q23_8, Q23_9, Q23_10, Q23_11, Q23_12, Q23_13, Q23_13_TEXT, Q24, Q31, Q27, Q28, Q32, Q33_4, Q33_5, Q33_6, Q33_7, Q33_8, Q33_9, Q33_10, Q33_11, Q33_12, Q33_13, Q33_13_TEXT, Q34, Q35, Q36, Q37, Q39_1_A, Q39_2_A, Q39_3_A, Q39_4_A, Q39_5_A, Q39_6_A, Q39_7_A, Q39_8_A, Q39_1_B, Q39_2_B, Q39_3_B, Q39_4_B, Q39_5_B, Q39_6_B, Q39_7_B, Q39_8_B, Q39_9_A, Q39_10_A, Q39_11_A, Q39_12_A, Q39_13_A, Q39_14_A, Q39_15_A, Q39_16_A, Q39_9_B, Q39_10_B, Q39_11_B, Q39_12_B, Q39_13_B, Q39_14_B, Q39_15_B, Q39_16_B, Q39_17_A, Q39_18_A, Q39_19_A, Q39_20_A, Q39_21_A, Q39_22_A, Q39_23_A, Q40_24_A, Q39_17_B, Q39_18_B, Q39_19_B, Q39_20_B, Q39_21_B, Q39_22_B, Q39_23_B, Q40_24_B, Q39_25_A, Q39_26_A, Q39_27_A, Q39_28_A, Q39_29_A, Q39_30_A, Q39_31_A, Q43_44_A, Q39_25_B, Q39_26_B, Q39_27_B, Q39_28_B, Q39_29_B, Q39_30_B, Q39_31_B, Q43_44_B, Q44
            )
        ) a)b LEFT JOIN "PO_HRIS_DB"."survey".PO_Exit_Ref er ON er.question = b.Question;









select employee_id, w.HIERARCHY_1 as HIERARCHY_L1,
	w.HIERARCHY_2 as HIERARCHY_L2,
	w.HIERARCHY_3 as HIERARCHY_L3,
	w.HIERARCHY_4 as HIERARCHY_L4,
	w.HIERARCHY_5 as HIERARCHY_L5,
	w.HIERARCHY_6 as  HIERARCHY_L6,
	w.HIERARCHY_7 as HIERARCHY_L7,
	w.HIERARCHY_8 as HIERARCHY_L8,
	w.HIERARCHY_9 as HIERARCHY_L9,
	w.HIERARCHY_10 as HIERARCHY_L10, from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT w where snapshot_dt = '2024-04-30' limit 10;

select *
	 from TABLEAU.PUBLIC.WD_WORKER_SNAPSHOT w where snapshot_dt = '2022-12-31' and HIERARCHY_1 = HIERARCHY_2
     
     limit 10;

    

select distinct count(distinct region), snapshot_dt from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT group by 2 order by 2

where snapshot_dt = '2024-04-30'





        
        
SELECT 
    a.Record_Date,
    a.Start_Datetime,
    a.End_Datetime,
    a.Status,
    a.Progress,
    a.Duration,
    a.Finished,
    a.Recorded_Date,
    a.Response_Id,
    a.Termination_Date,
    a.Employee_ID,
 w.Termination_dt as Term_Dt_Snapshot,
 w.SPE_Business_Unit  ,
w.SPE_Division  ,
w.SPE_Sub_Division  ,
w.SPE_Dept  ,
w.SPE_Sub_Dept  ,
w.Benefit_Code  ,
w.Org_Level  ,
w.Management_Level  ,
w.Hire_Dt  ,
w.Original_Hire_Dt  ,
w.Continuous_Service_Dt  ,
null as Time_in_Job  ,
w.Job_Code  ,
w.Job_Title  ,
w.Job_Family_Func  ,
w.Job_Family_Grp  ,
w.Job_Family  ,
w.Business_Title  ,
w.Exempt  ,
w.FTE   ,
w.Time_Type  ,
w.Pay_Rate_Type  ,
w.Pay_Frequency  ,
w.Hourly_Rate  ,
w.Hourly_Rate_Currency  ,
w.Annual_Base_Pay  ,
w.Annual_Base_Currency  ,
w.Annual_Base_Pay_US  ,
w.Aspire_Target_Percentage  ,
w.Aspire_Bonus_Plan  ,
w.Aspire_Bonus  ,
w.Aspire_Bonus_Currency  ,
w.Aspire_Bonus_Plan_US  ,
w.Supervisory_Org  ,
w.HIERARCHY_1 as HIERARCHY_L1,
	w.HIERARCHY_2 as HIERARCHY_L2,
	w.HIERARCHY_3 as HIERARCHY_L3,
	w.HIERARCHY_4 as HIERARCHY_L4,
	w.HIERARCHY_5 as HIERARCHY_L5,
	w.HIERARCHY_6 as  HIERARCHY_L6,
	w.HIERARCHY_7 as HIERARCHY_L7,
	w.HIERARCHY_8 as HIERARCHY_L8,
	w.HIERARCHY_9 as HIERARCHY_L9,
	w.HIERARCHY_10 as HIERARCHY_L10,
w.Manager_Job_Title  ,
w.Employee_Type  ,
w.End_Employment_Dt  ,
w.Contingent_Worker  ,
w.Contingent_Worker_Type  ,
w.Union_Local_Code  ,
w.Union_Local_Name  ,
w.Region  ,
w.Work_City  ,
w.Work_State  ,
w.Work_Postal_Code  ,
w.Work_Country  ,
w.Dept_ID  ,
w.Gender  ,
w.Age  ,
w.Hispanic_Latino  ,
w.Race_Ethnicity  ,
w.Vetaran as Veteran  ,
w.Disbaility as Disability,
w.Work_Location  ,
w.Is_Voluntary_FG  ,
w.Business_Partner  ,
w.Job_Description  ,
l.Termination_Dt_all,
//w.employee_id,
case when l.Termination_Reason is null then w.Termination_Reason else  l.Termination_Reason end as Termination_Reason,
w.Is_Rehire,
Q3_374, Q3_376, Q3_378, Q3_388, Q3_386, Q3_380, Q3_381, Q3_382, Q3_375, Q3_377, Q3_379, Q3_383, Q3_384, Q3_385, Q3_387, Q4, Q6_4, Q6_5, Q6_6, Q6_7, Q6_8, Q6_9, Q6_10, Q6_11, Q6_12, Q6_13, Q6_14, Q6_15, Q6_15_TEXT, Q7, Q9_29, Q9_30, Q9_31, Q9_32, Q9_33, Q9_34, Q9_41, Q9_35, Q9_36, Q9_37, Q9_38, Q9_39, Q9_40, Q9_41_TEXT, Q10, Q12_61, Q12_62, Q12_63, Q12_64, Q12_65, Q12_66, Q12_67, Q12_68, Q12_69, Q12_79, Q12_70, Q12_71, Q12_72, Q12_73, Q12_74, Q12_75, Q12_76, Q12_77, Q12_78, Q12_79_TEXT, Q13, Q15_80, Q15_81, Q15_82, Q15_83, Q15_88, Q15_84, Q15_85, Q15_86, Q15_87, Q15_88_TEXT, Q16, Q18, Q19, Q20, Q21, Q23_4, Q23_5, Q23_6, Q23_7, Q23_8, Q23_9, Q23_10, Q23_11, Q23_12, Q23_13, Q23_13_TEXT, Q24, Q31, Q27, Q28, Q32, Q33_4, Q33_5, Q33_6, Q33_7, Q33_8, Q33_9, Q33_10, Q33_11, Q33_12, Q33_13, Q33_13_TEXT, Q34, Q35, Q36, Q37, Q39_1_A, Q39_2_A, Q39_3_A, Q39_4_A, Q39_5_A, Q39_6_A, Q39_7_A, Q39_8_A, Q39_1_B, Q39_2_B, Q39_3_B, Q39_4_B, Q39_5_B, Q39_6_B, Q39_7_B, Q39_8_B, Q39_9_A, Q39_10_A, Q39_11_A, Q39_12_A, Q39_13_A, Q39_14_A, Q39_15_A, Q39_16_A, Q39_9_B, Q39_10_B, Q39_11_B, Q39_12_B, Q39_13_B, Q39_14_B, Q39_15_B, Q39_16_B, Q39_17_A, Q39_18_A, Q39_19_A, Q39_20_A, Q39_21_A, Q39_22_A, Q39_23_A, Q40_24_A, Q39_17_B, Q39_18_B, Q39_19_B, Q39_20_B, Q39_21_B, Q39_22_B, Q39_23_B, Q40_24_B, Q39_25_A, Q39_26_A, Q39_27_A, Q39_28_A, Q39_29_A, Q39_30_A, Q39_31_A, Q43_44_A, Q39_25_B, Q39_26_B, Q39_27_B, Q39_28_B, Q39_29_B, Q39_30_B, Q39_31_B, Q43_44_B, Q44
FROM "PO_HRIS_DB"."survey".po_exit_survey a
LEFT JOIN (select * from(Select *,row_number() over (partition by employee_id order by snapshot_dt desc) rk from TABLEAU.PUBLIC.VW_WD_SNAPSHOT 
//where active_status = 'False' 
)c where c.rk =1 )w on w.employee_id = a.employee_id 
LEFT JOIN PO_STAGE_DB."Worker".PO_WORKER_SNAPSHOT_20231203 l on l.employee_id = a.employee_id  and l.snapshot_dt = '2023-10-31' 
;

select * from "PO_HRIS_DB"."survey".po_exit_survey a

create or replace view vw_day14_new_hire_survey as
select
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
employee_id,
Q8 as "I received clear information that prepared me for my first day (e.g. what to expect, where to go, what to bring, etc.)",
Q10 as "What information could we have provided that would have helped you feel better prepared for your first day?",
Q12 as "How would you rate your first day at Sony Pictures Entertainment?",
Q9 as "On my first day, my workspace was organized,ready and had everything I needed to begin working.",
Q13 as "What was missing from your workspace that you needed?",
Q14_1 as "On my first day, I had the following available to me. - Computer (PC or Laptop)",
Q14_2 as "On my first day, I had the following available to me. - IDM Password (password you use to access your computer)",
Q14_3 as "On my first day, I had the following available to me. - Employee Badge",
Q14_4 as "On my first day, I had the following available to me. - Email Access",
Q14_5 as "On my first day, I had the following available to me. - Desk Phone",
Q14_6 as "On my first day, I had the following available to me. - Mobile Phone",
Q14_7 as "On my first day, I had the following available to me. - Other (Please Specify)",
Q14_7_TEXT as "On my first day, I had the following available to me. - Other (Please Specify) - Text",
Q15 as "On day one, I was given clear instructions on how to contact the IT Help Desk.",
Q16 as "I know where to go to request additional IT access and assets necessary to do my job.",
Q17 as "To help us improve the process, do you have any ideas/suggestions for requesting IT assets and systems?",
Q20 as "My direct manager made me feel welcome to the team.",
Q21 as "My co-workers made me feel welcome to the team.",
Q22 as "My team has helped me get acclimated into my new position.",
Q23 as "I understand what is expected of me to be successful in my job",
Q25 as "SPE provides the tools and resources needed for me to be effective at my job",
Q27 as "I believe that I will be a good fit within SPEculture.",
Q28 as "My job is turning out to be as I expected.",
Q29 as "In what ways has your job been different from expected?",
Q30 as "Did you attend New Hire Orientation?",
Q31 as "What aspect of the orientation did you feel was the most helpful?",
Q32 as "What information (if any) was missing or not properly covered during your orientation that would have been helpful?",
Q34 as "Thus far, how satisfied are you with your onboarding experience at SPE?",
Q33 as "During the past two weeks, what has worked well in helping you transition into SPE?",
Q35 as "During the past two weeks, what could we have done differently to better help you transition into SPE?",
Q38 as "How likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends or colleagues?",
Q40 as "How likely would you recommend Sony Pictures Entertainment movies to your family, friends or colleagues?",
Q42 as "How likely would you recommend Sony Pictures Entertainment television shows to your family, friends or colleagues?"
from PO_HRIS_DB."survey".PO_NEW_HIRE_14DAY_SURVEY;

create or replace view vw_decline_survey as
select
Start_Date as "Start_Date",
End_Date as "End_Date",
Status as "Status",
Duration as "Duration",
Finished as "Finished",
Recorded_Date as "Recorded_Date",
Response_Id as "Response_Id",
Distribution_Channel as "Distribution_Channel",
User_Language as "User_Language",
Q3 as "Please select the reason(s) for passing on the SPE role. (Select all that apply) - Selected Choice",
Q2_14_TEXT as "Please select the reason(s) for passing on the SPE role. (Select all that apply) - Other (please specify) - Text",
Q4 as "Of the reasons selected, which was the most influential? (Note: If one option was selected from the previous question, please select the sole reason) - Selected Choice",
Q3_14_TEXT as "Of the reasons selected, which was the most influential? (Note: If one option was selected from the previous question, please select the sole reason) - Other (please specify) - Text",
Q4 as "What could we have offered that would have made you reconsider accepting a role at SPE?",
Q5 as "In percentage, please estimate how far off SPEâ€™s offered base salary was versus your desired salary?",
Q6 as "Please select which of the following best describe your situation after declining SPEâ€™s offer.",
Q8_NPS_CATEGORY as "Based on your recruiting experience, how likely would you recommend Sony Pictures Entertainment as a potential place to work to your family, friends, or colleagues? - Group",
Q8 as "Based on your recruiting experience, how likely would you recommend Sony Pictures Entertainment as a potential place to work to your family, friends, or colleagues?",
Q7 as "Please use the space below for any additional feedback you may have about your experience with SPE during your recruitment process."
from PO_HRIS_DB."survey".PO_DECLINE_SURVEY;

create or replace view vw_candidate_survey as
select
Start_Date as "Start_Date",
End_Date as "End_Date",
Status as "Status",
Progress as "Progress",
Duration as "Duration",
Finished as "Finished",
Recorded_Date as "Recorded_Date",
Response_Id as "Response_Id",
Recipient_Email as "Recipient_Email",
External_Reference as "External_Reference",
Distribution_Channel as "Distribution_Channel",
User_Language as "User_Language",
Job_Requisition as "Job_Requisition",
Candidate_ID as "Candidate_ID",
Req_ID as "Req_ID",
Applied_Date as "Applied_Date",
Offer_Date as "Offer_Date",
Q5 as"How satisfied were you with your recruiting experience at Sony Pictures Entertainment",
Q3_NPS_GROUP as"Based on your experience thus far, how likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends, or colleagues? - Grou",
Q3 as"Based on your experience thus far, how likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends, or colleagues",
Q7_NPS_GROUP as"Based on your experience thus far, how likely would you recommend Sony Pictures Entertainment's movies or television shows to your family and friends? - Grou",
Q7 as"Based on your experience thus far, how likely would you recommend Sony Pictures Entertainment's movies or television shows to your family and friends",
Q4 as"I would be interested in applying for future opportunities at Sony Pictures Entertainment",
Q8 as"Please share what could have been done differently to improve your interview or recruiting experience at SPE",
Q9 as"Did you visit our career site (www.sonypicturesjobs.com) when applying for this position",
Q10 as"The information presented on the SPE career site was helpful in preparing for my interview",
Q12 as"The SPE career site was easy to navigate",
Q11_14_TEXT as"What were the primary reasons for choosing to apply at SPE? (Select up to 3 responses) - Other  - Tex",
Q13 as"Did you have an in-person interview",
Q14 as"The recruiting team member who hosted me for my interview(s) was helpful throughout my onsite process (e.g., greeted me when I arrived onsite)",
Q15 as"My video or phone interview was free of technical issues",
Q16 as"If any technical issues arised, I received immediate assistance to help resolve them",
Q17 as"I was provided adequate instructions to attend my video or phone interview",
Q18 as"The Sony Pictures Entertainment recruiter gave me a clear explanation
of the role and responsibilities for the position(s) I was applying for",
Q19 as"The interview scheduling process was efficient",
Q20 as"I received feedback about my interview(s) in a timely manner",
Q21 as"Upon arriving for my interview(s), I felt welcomed",
Q22 as"Throughout the interview process, I felt welcomed",
Q23 as"The interviewers asked relevant questions about my experience",
Q24 as"After interviewing, I felt that I had clear expectations of the role"
from PO_HRIS_DB."survey".PO_CANDIDATE_SURVEY;

create or replace view vw_anniversary_survey as
Select *,case when eNPS_EMP between 0 and 6 then 'Detractor' 
when eNPS_EMP between 7 and 8 then 'Passive' 
when eNPS_EMP between 9 and 10 then 'Promoter' 
else null end as eNPS_Category,
case when eNPS_TV between 0 and 6 then 'Detractor' 
when eNPS_TV between 7 and 8 then 'Passive' 
when eNPS_TV between 9 and 10 then 'Promoter' 
else null end as eNPS_TV_Category,
case when eNPS_MOV between 0 and 6 then 'Detractor' 
when eNPS_MOV between 7 and 8 then 'Passive' 
when eNPS_MOV between 9 and 10 then 'Promoter' 
else null end as eNPS_MOV_Category
from 
(
select
Start_Date as "Start_Date",
End_Date as "End_Date",
Status as "Status",
Progress as "Progress",
Duration as "Duration",
Finished as "Finished",
Recorded_Date as "Recorded_Date",
Response_Id as "Response_Id",
Anniversary_Date as "Anniversary_Date",
Employee_ID as "Employee_ID",
Participant_Unique_Identifier as "Participant_Unique_Identifier",
'FY '||dd.fiscal_year as Fiscal_Year,
('FY '||dd.fiscal_year)||(' Q'||dd.Fiscal_Quarter) as FY_Quarter,
//a.Fiscal_Year as "Source_Fiscal_Year",
//a.FY_Quarter as   "Source_FY_Quarter",
case when eNPS_EMP like '%10%' then '10'
when eNPS_EMP like '%0 - %' then '0' else eNPS_EMP end as eNPS_EMP,
case when eNPS_MOV like '%10%' then '10'
when eNPS_MOV like '%0 - %' then '0' else eNPS_MOV end as eNPS_MOV,
case when eNPS_TV like '%10%' then '10'
when eNPS_TV like '%0 - %' then '0' else eNPS_TV end as eNPS_TV,
//eNPS_EMP as "How likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends or colleagues?",
//eNPS_MOV as "How likely would you recommend Sony Pictures Entertainment movies to your family, friends or colleagues?",
//eNPS_TV as "How likely would you recommend Sony Pictures Entertainment television shows to your family, friends or colleagues?",
trim(substr((case when upper(Q1_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_1) end ),1,24)) as "Q1 - I am excited about Sony Group's future",
trim(substr((case when upper(Q1_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_2) end ),1,24)) as "Q1 - I am happy working at Sony Pictures Entertainment",
trim(substr((case when upper(Q1_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_3) end ),1,24)) as "Q1 - I am able to successfully balance my work and personal life",
trim(substr((case when upper(Q1_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_4) end ),1,24)) as "Q1 - I am comfortable asking other SPE colleagues for help when needed",
trim(substr((case when upper(Q1_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_5) end ),1,24)) as "Q1 - I have a clear understanding of SPE strategy and goals",
trim(substr((case when upper(Q1_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_6) end ),1,24)) as "Q1 - I understand what is expected of me to be successful at my job",
trim(substr((case when upper(Q1_7) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q1_7) end ),1,24)) as "Q1 - I understand how my work contributes to the overall success of SPE",
trim(substr((case when upper(Q2_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_1) end ),1,24)) as "Q2 - I believe strongly in the values and principles set forth at SPE",
trim(substr((case when upper(Q2_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_2) end ),1,24)) as "Q2 - I believe meaningful action will be taken as a result of this survey",
trim(substr((case when upper(Q2_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_3) end ),1,24)) as "Q2 - I would recommend my manager to others",
trim(substr((case when upper(Q2_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_4) end ),1,24)) as "Q2 - I often receive praise or recognition for doing a job well done",
trim(substr((case when upper(Q2_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_5) end ),1,24)) as "Q2 - I intend to be working at SPE for a long time",
trim(substr((case when upper(Q2_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_6) end ),1,24)) as "Q2 - I regularly put in extra effort to help SPE succeed",
trim(substr((case when upper(Q2_7) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_7) end ),1,24)) as "Q2 - I have confidence that senior leadership has SPE headed in the right direction over the next three to five years",
trim(substr((case when upper(Q2_8) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q2_8) end ),1,24)) as "Q2 - I feel a sense of belonging at SPE",
trim(substr((case when upper(Q5_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q5_1) end ),1,24)) as "Q5 - My direct manager and I have open and honest conversations about my career progression and development",
trim(substr((case when upper(Q5_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q5_2) end ),1,24)) as "Q5 - My direct manager provides clear and regular feedback on my performance",

trim(substr((case when upper(Q5_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q5_3) end ),1,24)) as "Q5 - My department actively seeks to understand customer wants and needs",

trim(substr((case when upper(Q5_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q5_4) end ),1,24)) as "Q5 - My talents and strengths are fully utilized in performing my job",

trim(substr((case when upper(Q5_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q5_5) end ),1,24)) as "Q5 - My team collaborates with other teams effectively to get things done",

trim(substr((case when upper(Q5_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q5_6) end ),1,24)) as "Q5 - SPE is using new technologies and creative approaches in how work is done",

trim(substr((case when upper(Q6_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_1) end ),1,24)) as "Q6 - SPE has a great culture.",
trim(substr((case when upper(Q6_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_2) end ),1,24)) as "Q6 - SPE demonstrates care and concern for me as an employee.",
trim(substr((case when upper(Q6_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_3) end ),1,24)) as "Q6 - SPE provides the tools and resources needed for me to be effective at my job.",
trim(substr((case when upper(Q6_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_4) end ),1,24)) as "Q6 - SPE provides a clear career path that I can work towards.",
trim(substr((case when upper(Q6_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_5) end ),1,24)) as "Q6 - SPE enables people from diverse backgrounds to excel.",
trim(substr((case when upper(Q6_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_6) end ),1,24)) as "Q6 - SPE fosters an environment of innovation.",
trim(substr((case when upper(Q6_7) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q6_7) end ),1,24)) as "Q6 - SPE moves quickly in moving an idea into implementation.",
trim(substr((case when upper(Q7_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q7_1) end ),1,24)) as "Q7 - At SPE, we do an excellent job anticipating new content and services that our customers will value.",
trim(substr((case when upper(Q7_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q7_2) end ),1,24)) as "Q7 - Working at SPE gives me ample opportunity to grow and develop my career.",
trim(substr((case when upper(Q7_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q7_3) end ),1,24)) as "Q7 - The work that I do at SPE is meaningful to me.",
trim(substr((case when upper(Q7_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q7_4) end ),1,24)) as "Q7 - In my opinion, decisions are made in a timely manner at SPE.",
trim(substr((case when upper(Q7_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q7_5) end ),1,24)) as "Q7 - Information and knowledge are shared openly within SPE.",
trim(substr((case when upper(Q7_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q7_6) end ),1,24)) as "Q7 - SPE has a culture that allows an individual to learn and grow from mistakes made.",
trim(substr((case when upper(Q8_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q8_1) end ),1,24)) as "Q8 - Thoughts and ideas are shared effectively between divisions.",
trim(substr((case when upper(Q8_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q8_2) end ),1,24)) as "Q8 - There are no substantial obstacles [e.g., bureaucracy, waste, unnecessary rules, etc.] at work to doing my job well.",
trim(substr((case when upper(Q8_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q8_3) end ),1,24)) as "Q8 - The pace of the work in this organization enables me to do a good job.",
trim(substr((case when upper(Q8_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q8_4) end ),1,24)) as "Q8 - We hold ourselves and our team members accountable for results.",
trim(substr((case when upper(Q8_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q8_5) end ),1,24)) as "Q8 - Employees are kept well informed about issues facing our company.",
trim(substr((case when upper(Q8_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q8_6) end ),1,24)) as "Q8 - Senior Leadership values diverse perspectives when important decisions are made.",
trim(substr((case when upper(Q3_1) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q3_1) end ),1,24)) as "Q3 - I feel that my opinions and thoughts matter at SPE.",
trim(substr((case when upper(Q3_2) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q3_2) end ),1,24)) as "Q3 - I feel that my career goals can be met at SPE.",
trim(substr((case when upper(Q3_3) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q3_3) end ),1,24)) as "Q3 - I feel that SPE employees are provided career advancement opportunities primarily due to their work performance.",
trim(substr((case when upper(Q3_4) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q3_4) end ),1,24)) as "Q3 - I feel that I can bring up differing opinions and perspectives to my superiors.",
trim(substr((case when upper(Q3_5) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q3_5) end ),1,24)) as "Q3 - I feel empowered to help Sony achieve its environmental objective to reduce carbon emissions, encourage sustainability through products and marketing campaigns, or procure eco-certified products.",
trim(substr((case when upper(Q3_6) like '%NEITHER AGREE%' then 'NEITHER AGREE OR DISAGREE' else upper(Q3_6) end ),1,24)) as "Q3 - I feel safe to take appropriate risks at SPE.",
Q3_7,
upper(case when Q3_7 = 'Sometimes' then 'Neither Agree or Disagree'
when Q3_7 = 'Very Often' then 'Somewhat Agree'
when Q3_7 = 'Always' then 'Strongly Agree'
when Q3_7 = 'Rarely' then 'Somewhat Disagree'
when Q3_7 = 'Never' then 'Strongly Disagree'
when upper(Q3_7) like '%NEITHER AGREE%' then 'Neither Agree or Disagree'
else Q3_7 end) as "Q3 - Do I feel free to be myself at work every day?",

Q4 as "For the previous question (QID66-ChoiceDescription-22). please explain why or why not.",
Q73 as "What area(s) of your SPE workplace experience are you most satisfied with? Please Explain.",
Q74 as "What area(s) can SPE work on to improve your workplace experience? Please Explain.",
Q75 as "What one change can SPE initiate to make you more effective in your job and/or career? Please Explain."
from
(
select
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
eNPS_EMP,
eNPS_MOV,
eNPS_TV,
Q6_2,
Q1_2,
Q1_4,
Q8_3,
Q6_3,
Q8_2,
Q5_4,
Q7_3,
Q2_5,
Q3_1,
Q8_1,
Q2_4,
Q1_6,
Q1_7,
Q8_4,
Q5_1,
Q5_2,
Q2_3,
Q7_2,
Q6_4,
Q3_2,
Q3_3,
Q6_5,
Q1_5,
Q7_4,
Q2_1,
Q2_7,
Q1_1,
Q5_3,
Q7_1,
Q6_6,
Q3_4,
Q5_6,
Q6_7,
Q5_5,
Q7_6,
Q8_5,
Q7_5,
Q8_6,
Q1_3,
Q2_6,
Q6_1,
Q2_2,
Q3_5,
Q3_6,
Q3_7,
Q2_8,
Q4,
Q73,
Q74,
Q75,
NULL,
NULL,
Anniversary_Date,
NULL,
Employee_ID,
null as Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
From PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY
union all
select
to_timestamp(StartDate||':00'),
to_timestamp(EndDate||':00'),
Status,
Progress,
Duration,
Finished,
to_date(RecordedDate||':00'),
ResponseId,
eNPS_EMP,
eNPS_MOV,
eNPS_TV,
Q6_2,
Q1_2,
Q1_4,
Q8_3,
Q6_3,
Q8_2,
Q5_4,
Q7_3,
Q2_5,
Q3_1,
Q8_1,
Q2_4,
Q1_6,
Q1_7,
Q8_4,
Q5_1,
Q5_2,
Q2_3,
Q7_2,
Q6_4,
Q3_2,
Q3_3,
Q6_5,
Q1_5,
Q7_4,
Q2_1,
Q2_7,
Q1_1,
Q5_3,
Q7_1,
Q6_6,
Q3_4,
Q5_6,
Q6_7,
Q5_5,
Q7_6,
Q8_5,
Q7_5,
Q8_6,
Q1_3,
Q2_6,
Q6_1,
Q2_2,
Q3_5,
Q3_6,
Q3_7,
NULL,
Q4,
Q73,
Q74,
Q75,
NULL,
NULL,
Anniversary_Date::date,
NULL,
Employee_ID,
Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY23
union all
select 
to_timestamp(StartDate||':00'),
to_timestamp(EndDate||':00'),
Status,
Progress,
Duration,
Finished,
to_timestamp(RecordedDate||':00'),
ResponseId,
NPS_EMP,
NPS_MOV,
NPS_TV,
CARE_EMP,
HAP_SPE,
ASK_HLP,
PCE_ORG,
TLS_RSC,
WRK_OBST,
TLT_STR,
WRK_MNG,
WRK_LNG,
OPN_MAT,
IDEA_SHR,
PRS_REC,
JOB_EXP,
CNTR_SUC,
ACNT_RSLT,
HON_DISC,
MGR_FDB,
MGR_RCMMD,
GRW_CAR,
CLR_PTH,
CAR_GLS,
CAR_OPP,
DIV_EXC,
UND_STRT,
DEC_TIME,
VALUE_SPE,
LDR_CONF,
SONY_EXC,
CUST_NEED,
CUST_VALUE,
ENV_INV,
DIF_OPN,
CRE_APR,
IDEA_QCK,
TEAM_COLLAB,
LRN_GRW,
EMP_INF,
INF_SHR,
LDR_DIV,
WRK_LFE,
XTR_EFF,
CULT_SPE,
SVY_ACT,
ENV_SUST,
TKE_RSK,
FEEL_FREE,
NULL,
Q47,
Q48,
Q49,
Q50,
NULL,
NULL,
Anniversary_Date::date,
NULL,
Employee_ID,
Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY22

union all
select 
to_timestamp(Start_Date||':00'),
to_timestamp(End_Date||':00'),
Status,
Progress,
Duration,
Finished,
to_timestamp(Recorded_Date||':00'),
Response_Id,
NPS_EMP,
NPS_MOV,
NPS_TV,
CARE_EMP,
HAP_SPE,
NULL,
PCE_ORG,
TLS_RSC,
WRK_OBST,
TLT_STR,
WRK_MNG,
WRK_LNG,
OPN_MAT,
IDEA_SHR,
PRS_REC,
JOB_EXP,
NULL,
NULL,
HON_DISC,
MGR_FDB,
MGR_RCMMD,
GRW_CAR,
NULL,
CAR_GLS,
CAR_OPP,
DIV_EXC,
UND_STRT,
DEC_TIME,
VALUE_SPE,
LDR_CONF,
SONY_EXC,
CUST_NEED,
CUST_VALUE,
ENV_INV,
NULL,
CRE_APR,
IDEA_QCK,
TEAM_COLLAB,
NULL,
EMP_INF,
INF_SHR,
LDR_DIV,
WRK_LFE,
XTR_EFF,
CULT_SPE,
SVY_ACT,
ENV_SUST,
NULL,
FEEL_FREE,
NULL,
Q47,
Q48,
Q49,
Q50,
SGST_INV,
CAR_PTH,
Anniversary_Date::date,
NULL,
Employee_ID,
Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY21
union all
select
to_timestamp(StartDate||':00'),
to_timestamp(EndDate||':00'),
Status,
Progress,
Duration,
Finished,
to_timestamp(RecordedDate||':00'),
ResponseId,
NPS_EMP,
NPS_MOV,
NPS_TV,
CARE_EMP,
HAP_SPE,
ASK_HLP,
PCE_ORG,
TLS_RSC,
WRK_OBST,
TLT_STR,
WRK_MNG,
WRK_LNG,
OPN_MAT,
IDEA_SHR,
PRS_REC,
JOB_EXP,
CNTR_SUC,
ACNT_RSLT,
HON_DISC,
MGR_FDB,
MGR_RCMMD,
GRW_CAR,
CLR_PTH,
CAR_GLS,
CAR_OPP,
DIV_EXC,
UND_STRT,
DEC_TIME,
VALUE_SPE,
LDR_CONF,
SONY_EXC,
CUST_NEED,
CUST_VALUE,
ENV_INV,
DIF_OPN,
CRE_APR,
IDEA_QCK,
TEAM_COLLAB,
LRN_GRW,
EMP_INF,
INF_SHR,
LDR_DIV,
WRK_LFE,
XTR_EFF,
CULT_SPE,
SVY_ACT,
ENV_SUST,
TKE_RSK,
FEEL_FREE,
NULL,
Q47,
Q48,
Q49,
Q50,
SGST_INV,
CAR_PTH,
Anniversary_Date::date,
Participant_Email,
NULL,
NULL,
NULL,
NULL
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY20
)a inner join PO_HRIS_DB."Calender".DIM_DATE dd on  dd.date = a.anniversary_date
where anniversary_date is not null 
)b
;

--old
create or replace view vw_anniversary_survey as
Select *,case when eNPS_EMP between 0 and 6 then 'Detractor' 
when eNPS_EMP between 7 and 8 then 'Passive' 
when eNPS_EMP between 9 and 10 then 'Promoter' 
else null end as eNPS_Category,
case when eNPS_TV between 0 and 6 then 'Detractor' 
when eNPS_TV between 7 and 8 then 'Passive' 
when eNPS_TV between 9 and 10 then 'Promoter' 
else null end as eNPS_TV_Category,
case when eNPS_MOV between 0 and 6 then 'Detractor' 
when eNPS_MOV between 7 and 8 then 'Passive' 
when eNPS_MOV between 9 and 10 then 'Promoter' 
else null end as eNPS_MOV_Category
from 
(
select
Start_Date as "Start_Date",
End_Date as "End_Date",
Status as "Status",
Progress as "Progress",
Duration as "Duration",
Finished as "Finished",
Recorded_Date as "Recorded_Date",
Response_Id as "Response_Id",
Anniversary_Date as "Anniversary_Date",
Employee_ID as "Employee_ID",
Participant_Unique_Identifier as "Participant_Unique_Identifier",
'FY '||dd.fiscal_year as Fiscal_Year,
('FY '||dd.fiscal_year)||(' Q'||dd.Fiscal_Quarter) as FY_Quarter,
//a.Fiscal_Year as "Source_Fiscal_Year",
//a.FY_Quarter as   "Source_FY_Quarter",
case when eNPS_EMP like '%10%' then '10'
when eNPS_EMP like '%0 - %' then '0' else eNPS_EMP end as eNPS_EMP,
case when eNPS_MOV like '%10%' then '10'
when eNPS_MOV like '%0 - %' then '0' else eNPS_MOV end as eNPS_MOV,
case when eNPS_TV like '%10%' then '10'
when eNPS_TV like '%0 - %' then '0' else eNPS_TV end as eNPS_TV,
//eNPS_EMP as "How likely would you recommend Sony Pictures Entertainment as a place to work to your family, friends or colleagues?",
//eNPS_MOV as "How likely would you recommend Sony Pictures Entertainment movies to your family, friends or colleagues?",
//eNPS_TV as "How likely would you recommend Sony Pictures Entertainment television shows to your family, friends or colleagues?",
case when Q1_1 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_1 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_1 = 'Strongly agree' then 'Strongly Agree'
when Q1_1 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_1 = 'Strongly disagree' then 'Strongly Disagree' else Q1_1 end as "Q1 - I am excited about Sony Group's future",

case when Q1_2 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_2 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_2 = 'Strongly agree' then 'Strongly Agree'
when Q1_2 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_2 = 'Strongly disagree' then 'Strongly Disagree' else Q1_2 end as "Q1 - I am happy working at Sony Pictures Entertainment",

case when Q1_3 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_3 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_3 = 'Strongly agree' then 'Strongly Agree'
when Q1_3 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_3 = 'Strongly disagree' then 'Strongly Disagree' else Q1_3 end as "Q1 - I am able to successfully balance my work and personal life",

case when Q1_4 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_4 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_4 = 'Strongly agree' then 'Strongly Agree'
when Q1_4 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_4 = 'Strongly disagree' then 'Strongly Disagree' else Q1_4 end as "Q1 - I am comfortable asking other SPE colleagues for help when needed",

case when Q1_5 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_5 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_5 = 'Strongly agree' then 'Strongly Agree'
when Q1_5 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_5 = 'Strongly disagree' then 'Strongly Disagree' else Q1_5 end as "Q1 - I have a clear understanding of SPE strategy and goals",

case when Q1_6 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_6 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_6 = 'Strongly agree' then 'Strongly Agree'
when Q1_6 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_6 = 'Strongly disagree' then 'Strongly Disagree' else Q1_6 end as "Q1 - I understand what is expected of me to be successful at my job",

case when Q1_7 = 'Neither agree nor disagree' then 'Neither Agree or Disagree'
when Q1_7 = 'Somewhat agree' then 'Somewhat Agree'
when Q1_7 = 'Strongly agree' then 'Strongly Agree'
when Q1_7 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q1_7 = 'Strongly disagree' then 'Strongly Disagree' else Q1_7 end as "Q1 - I understand how my work contributes to the overall success of SPE",

trim(substr((case when upper(Q2_1) like '%NEITHER AGREE%' then 'Neither Agree or Disagree' else upper(Q2_1) end ),1,24)) as Q2_1,

case when upper(Q2_1) like '%NEITHER AGREE%' then 'Neither Agree or Disagree'
when Q2_1 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_1 = 'Strongly agree' then 'Strongly Agree'
when Q2_1 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_1 = 'Strongly disagree' then 'Strongly Disagree' else Q2_1 end as "Q2 - I believe strongly in the values and principles set forth at SPE",

case when upper(Q2_2) like '%NEITHER AGREE%'then 'Neither Agree or Disagree'
when Q2_2 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_2 = 'Strongly agree' then 'Strongly Agree'
when Q2_2 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_2 = 'Strongly disagree' then 'Strongly Disagree' else Q2_2 end as "Q2 - I believe meaningful action will be taken as a result of this survey",

case when upper(Q2_3) like '%NEITHER AGREE%' then 'Neither Agree or Disagree'
when Q2_3 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_3 = 'Strongly agree' then 'Strongly Agree'
when Q2_3 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_3 = 'Strongly disagree' then 'Strongly Disagree' else Q2_3 end as "Q2 - I would recommend my manager to others",

case when upper(Q2_4) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q2_4 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_4 = 'Strongly agree' then 'Strongly Agree'
when Q2_4 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_4 = 'Strongly disagree' then 'Strongly Disagree' else Q2_4 end as "Q2 - I often receive praise or recognition for doing a job well done",

case when upper(Q2_5) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q2_5 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_5 = 'Strongly agree' then 'Strongly Agree'
when Q2_5 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_5 = 'Strongly disagree' then 'Strongly Disagree' else Q2_5 end as "Q2 - I intend to be working at SPE for a long time",

case when upper(Q2_6) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q2_6 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_6 = 'Strongly agree' then 'Strongly Agree'
when Q2_6 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_6 = 'Strongly disagree' then 'Strongly Disagree' else Q2_6 end as "Q2 - I regularly put in extra effort to help SPE succeed",

case when upper(Q2_7) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q2_7 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_7 = 'Strongly agree' then 'Strongly Agree'
when Q2_7 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_7 = 'Strongly disagree' then 'Strongly Disagree' else Q2_7 end as "Q2 - I have confidence that senior leadership has SPE headed in the right direction over the next three to five years",

case when upper(Q2_8) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q2_8 = 'Somewhat agree' then 'Somewhat Agree'
when Q2_8 = 'Strongly agree' then 'Strongly Agree'
when Q2_8 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q2_8 = 'Strongly disagree' then 'Strongly Disagree' else Q2_8 end as "Q2 - I feel a sense of belonging at SPE",

case when upper(Q5_1) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q5_1 = 'Somewhat agree' then 'Somewhat Agree'
when Q5_1 = 'Strongly agree' then 'Strongly Agree'
when Q5_1 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q5_1 = 'Strongly disagree' then 'Strongly Disagree' else Q5_1 end as "Q5 - My direct manager and I have open and honest conversations about my career progression and development",

case when upper(Q5_2) like '%NEITHER AGREE%' then 'Neither Agree or Disagree'
when Q5_2 = 'Somewhat agree' then 'Somewhat Agree'
when Q5_2 = 'Strongly agree' then 'Strongly Agree'
when Q5_2 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q5_2 = 'Strongly disagree' then 'Strongly Disagree' else Q5_2 end as "Q5 - My direct manager provides clear and regular feedback on my performance",

case when upper(Q5_3) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q5_3 = 'Somewhat agree' then 'Somewhat Agree'
when Q5_3 = 'Strongly agree' then 'Strongly Agree'
when Q5_3 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q5_3 = 'Strongly disagree' then 'Strongly Disagree' else Q5_3 end as "Q5 - My department actively seeks to understand customer wants and needs",

case when upper(Q5_4) like '%NEITHER AGREE%'  then 'Neither Agree or Disagree'
when Q5_4 = 'Somewhat agree' then 'Somewhat Agree'
when Q5_4 = 'Strongly agree' then 'Strongly Agree'
when Q5_4 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q5_4 = 'Strongly disagree' then 'Strongly Disagree' else Q5_4 end as "Q5 - My talents and strengths are fully utilized in performing my job",

case when upper(Q5_5) like '%NEITHER AGREE%' then 'Neither Agree or Disagree'
when Q5_5 = 'Somewhat agree' then 'Somewhat Agree'
when Q5_5 = 'Strongly agree' then 'Strongly Agree'
when Q5_5 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q5_5 = 'Strongly disagree' then 'Strongly Disagree' else Q5_5 end as "Q5 - My team collaborates with other teams effectively to get things done",

case 
when upper(Q5_6) like '%NEITHER AGREE%' then 'Neither Agree or Disagree'
when Q5_6 = 'Somewhat agree' then 'Somewhat Agree'
when Q5_6 = 'Strongly agree' then 'Strongly Agree'
when Q5_6 = 'Somewhat disagree' then 'Somewhat Disagree'
when Q5_6 = 'Strongly disagree' then 'Strongly Disagree' else Q5_6 end as "Q5 - SPE is using new technologies and creative approaches in how work is done",

Q6_1 as "Q6 - SPE has a great culture.",
Q6_2 as "Q6 - SPE demonstrates care and concern for me as an employee.",
Q6_3 as "Q6 - SPE provides the tools and resources needed for me to be effective at my job.",
Q6_4 as "Q6 - SPE provides a clear career path that I can work towards.",
Q6_5 as "Q6 - SPE enables people from diverse backgrounds to excel.",
Q6_6 as "Q6 - SPE fosters an environment of innovation.",
Q6_7 as "Q6 - SPE moves quickly in moving an idea into implementation.",
Q7_1 as "Q7 - At SPE, we do an excellent job anticipating new content and services that our customers will value.",
Q7_2 as "Q7 - Working at SPE gives me ample opportunity to grow and develop my career.",
Q7_3 as "Q7 - The work that I do at SPE is meaningful to me.",
Q7_4 as "Q7 - In my opinion, decisions are made in a timely manner at SPE.",
Q7_5 as "Q7 - Information and knowledge are shared openly within SPE.",
Q7_6 as "Q7 - SPE has a culture that allows an individual to learn and grow from mistakes made.",
Q8_1 as "Q8 - Thoughts and ideas are shared effectively between divisions.",
Q8_2 as "Q8 - There are no substantial obstacles [e.g., bureaucracy, waste, unnecessary rules, etc.] at work to doing my job well.",
Q8_3 as "Q8 - The pace of the work in this organization enables me to do a good job.",
Q8_4 as "Q8 - We hold ourselves and our team members accountable for results.",
Q8_5 as "Q8 - Employees are kept well informed about issues facing our company.",
Q8_6 as "Q8 - Senior Leadership values diverse perspectives when important decisions are made.",
Q3_1 as "Q3 - I feel that my opinions and thoughts matter at SPE.",
Q3_2 as "Q3 - I feel that my career goals can be met at SPE.",
Q3_3 as "Q3 - I feel that SPE employees are provided career advancement opportunities primarily due to their work performance.",
Q3_4 as "Q3 - I feel that I can bring up differing opinions and perspectives to my superiors.",
Q3_5 as "Q3 - I feel empowered to help Sony achieve its environmental objective to reduce carbon emissions, encourage sustainability through products and marketing campaigns, or procure eco-certified products.",
Q3_6 as "Q3 - I feel safe to take appropriate risks at SPE.",
Q3_7 as "Q3 - Do I feel free to be myself at work every day?",
Q4 as "For the previous question (QID66-ChoiceDescription-22). please explain why or why not.",
Q73 as "What area(s) of your SPE workplace experience are you most satisfied with? Please Explain.",
Q74 as "What area(s) can SPE work on to improve your workplace experience? Please Explain.",
Q75 as "What one change can SPE initiate to make you more effective in your job and/or career? Please Explain."
from
(
select
Start_Date,
End_Date,
Status,
Progress,
Duration,
Finished,
Recorded_Date,
Response_Id,
eNPS_EMP,
eNPS_MOV,
eNPS_TV,
Q6_2,
Q1_2,
Q1_4,
Q8_3,
Q6_3,
Q8_2,
Q5_4,
Q7_3,
Q2_5,
Q3_1,
Q8_1,
Q2_4,
Q1_6,
Q1_7,
Q8_4,
Q5_1,
Q5_2,
Q2_3,
Q7_2,
Q6_4,
Q3_2,
Q3_3,
Q6_5,
Q1_5,
Q7_4,
Q2_1,
Q2_7,
Q1_1,
Q5_3,
Q7_1,
Q6_6,
Q3_4,
Q5_6,
Q6_7,
Q5_5,
Q7_6,
Q8_5,
Q7_5,
Q8_6,
Q1_3,
Q2_6,
Q6_1,
Q2_2,
Q3_5,
Q3_6,
Q3_7,
Q2_8,
Q4,
Q73,
Q74,
Q75,
NULL,
NULL,
Anniversary_Date,
NULL,
Employee_ID,
null as Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
From PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY
union all
select
to_timestamp(StartDate||':00'),
to_timestamp(EndDate||':00'),
Status,
Progress,
Duration,
Finished,
to_date(RecordedDate||':00'),
ResponseId,
eNPS_EMP,
eNPS_MOV,
eNPS_TV,
Q6_2,
Q1_2,
Q1_4,
Q8_3,
Q6_3,
Q8_2,
Q5_4,
Q7_3,
Q2_5,
Q3_1,
Q8_1,
Q2_4,
Q1_6,
Q1_7,
Q8_4,
Q5_1,
Q5_2,
Q2_3,
Q7_2,
Q6_4,
Q3_2,
Q3_3,
Q6_5,
Q1_5,
Q7_4,
Q2_1,
Q2_7,
Q1_1,
Q5_3,
Q7_1,
Q6_6,
Q3_4,
Q5_6,
Q6_7,
Q5_5,
Q7_6,
Q8_5,
Q7_5,
Q8_6,
Q1_3,
Q2_6,
Q6_1,
Q2_2,
Q3_5,
Q3_6,
Q3_7,
NULL,
Q4,
Q73,
Q74,
Q75,
NULL,
NULL,
Anniversary_Date::date,
NULL,
Employee_ID,
Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY23
union all
select 
to_timestamp(StartDate||':00'),
to_timestamp(EndDate||':00'),
Status,
Progress,
Duration,
Finished,
to_timestamp(RecordedDate||':00'),
ResponseId,
NPS_EMP,
NPS_MOV,
NPS_TV,
CARE_EMP,
HAP_SPE,
ASK_HLP,
PCE_ORG,
TLS_RSC,
WRK_OBST,
TLT_STR,
WRK_MNG,
WRK_LNG,
OPN_MAT,
IDEA_SHR,
PRS_REC,
JOB_EXP,
CNTR_SUC,
ACNT_RSLT,
HON_DISC,
MGR_FDB,
MGR_RCMMD,
GRW_CAR,
CLR_PTH,
CAR_GLS,
CAR_OPP,
DIV_EXC,
UND_STRT,
DEC_TIME,
VALUE_SPE,
LDR_CONF,
SONY_EXC,
CUST_NEED,
CUST_VALUE,
ENV_INV,
DIF_OPN,
CRE_APR,
IDEA_QCK,
TEAM_COLLAB,
LRN_GRW,
EMP_INF,
INF_SHR,
LDR_DIV,
WRK_LFE,
XTR_EFF,
CULT_SPE,
SVY_ACT,
ENV_SUST,
TKE_RSK,
FEEL_FREE,
NULL,
Q47,
Q48,
Q49,
Q50,
NULL,
NULL,
Anniversary_Date::date,
NULL,
Employee_ID,
Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY22

union all
select 
to_timestamp(Start_Date||':00'),
to_timestamp(End_Date||':00'),
Status,
Progress,
Duration,
Finished,
to_timestamp(Recorded_Date||':00'),
Response_Id,
NPS_EMP,
NPS_MOV,
NPS_TV,
CARE_EMP,
HAP_SPE,
NULL,
PCE_ORG,
TLS_RSC,
WRK_OBST,
TLT_STR,
WRK_MNG,
WRK_LNG,
OPN_MAT,
IDEA_SHR,
PRS_REC,
JOB_EXP,
NULL,
NULL,
HON_DISC,
MGR_FDB,
MGR_RCMMD,
GRW_CAR,
NULL,
CAR_GLS,
CAR_OPP,
DIV_EXC,
UND_STRT,
DEC_TIME,
VALUE_SPE,
LDR_CONF,
SONY_EXC,
CUST_NEED,
CUST_VALUE,
ENV_INV,
NULL,
CRE_APR,
IDEA_QCK,
TEAM_COLLAB,
NULL,
EMP_INF,
INF_SHR,
LDR_DIV,
WRK_LFE,
XTR_EFF,
CULT_SPE,
SVY_ACT,
ENV_SUST,
NULL,
FEEL_FREE,
NULL,
Q47,
Q48,
Q49,
Q50,
SGST_INV,
CAR_PTH,
Anniversary_Date::date,
NULL,
Employee_ID,
Participant_Unique_Identifier,
FY_Quarter,
Fiscal_Year
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY21
union all
select
to_timestamp(StartDate||':00'),
to_timestamp(EndDate||':00'),
Status,
Progress,
Duration,
Finished,
to_timestamp(RecordedDate||':00'),
ResponseId,
NPS_EMP,
NPS_MOV,
NPS_TV,
CARE_EMP,
HAP_SPE,
ASK_HLP,
PCE_ORG,
TLS_RSC,
WRK_OBST,
TLT_STR,
WRK_MNG,
WRK_LNG,
OPN_MAT,
IDEA_SHR,
PRS_REC,
JOB_EXP,
CNTR_SUC,
ACNT_RSLT,
HON_DISC,
MGR_FDB,
MGR_RCMMD,
GRW_CAR,
CLR_PTH,
CAR_GLS,
CAR_OPP,
DIV_EXC,
UND_STRT,
DEC_TIME,
VALUE_SPE,
LDR_CONF,
SONY_EXC,
CUST_NEED,
CUST_VALUE,
ENV_INV,
DIF_OPN,
CRE_APR,
IDEA_QCK,
TEAM_COLLAB,
LRN_GRW,
EMP_INF,
INF_SHR,
LDR_DIV,
WRK_LFE,
XTR_EFF,
CULT_SPE,
SVY_ACT,
ENV_SUST,
TKE_RSK,
FEEL_FREE,
NULL,
Q47,
Q48,
Q49,
Q50,
SGST_INV,
CAR_PTH,
Anniversary_Date::date,
Participant_Email,
NULL,
NULL,
NULL,
NULL
from PO_HRIS_DB."survey".PO_ANNIVERSARY_SURVEY_FY20
)a inner join PO_HRIS_DB."Calender".DIM_DATE dd on  dd.date = a.anniversary_date
where anniversary_date is not null 
)b
;

;
create or replace view vw_job_req as 
select 
REQUISITION_ID ,
	JOB_REQUISITION ,
	REQUISITION_STATUS ,
	OPEN_DT ,
	FILL_DT ,
	HIRE_DT ,
	CLOSE_DT ,
	FREEZE_DT ,
	UNFREEZE_DT ,
	READY_TO_HIRE_DT ,
	OFFER_DT ,
	TARGET_REQ_DT ,
	TARGET_OFFER_DT ,
	HIRING_MANAGER ,
	REQUISITION_COUNTRY,
	RECRUITER ,
    RECRUITER_EMP_ID ,
	JOB_PROFILE ,
	BUSINESS_PARTNER ,
	REQ_LOCATION ,
	ORG_LEVEL ,
	DIVISION ,
	SUB_DIVISION ,
	DEPARTMENT ,
	SUB_DEPARTMENT ,
	EMPLOYEE_TYPE ,
	BENIFIT_CODE ,
	COMP_GRADE ,
	COMP_GRADE_MIN ,
	COMP_GRADE_MID ,
	COMP_GRADE_MAX ,
	UNIQUE_CANDIDATE ,
	HIRED ,
	TOTAL_APPLICATION  
    from PO_HRIS_DB."Application".PO_WD_REQUISITION r;

create or replace view TABLEAU."candidate".VW_JOB_REQ as
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
Employee_Type,
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
    when upper(last_recruiting_stage) = 'READY FOR HIRE' and upper(last_recruiting_step) = 'COMPLETION' then 'Hired'
    else last_recruiting_stage end as Derived_Last_Stage,
    last_recruiting_step,
    disposition_reason,
    //worker_subtype,
    REQ_Employee_Type as Employee_Type,
    count(distinct application_id)  as count_by_stg
    from

( 
    select *,row_number() over (partition by application_id order by ifnull(last_functionally_updated_dt::date,'1900-01-01') desc) as rks
    from "PO_HRIS_DB"."Application".PO_WD_CANDIDATE 
    where upper(SOURCE_SYSTEM) = 'CURRENT WORKDAY PRODUCTION'
     //and req_id like '%JR100164%' -- example to check number discrepency 
    //group by 1,2,3,4,5,6,7
)pa  
where rks =1 
group by 1,2,3,4,5,6,7,8
) a on upper(a.req_id) = upper(pr.requisition_id) ;



    