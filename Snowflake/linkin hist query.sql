

/*History Copy Script*/
/*
'2023-12-18','2024-03-05' modifeid dates to load history and run below script to delete unwanted files
delete from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_hist where source_filename IN ('outbound/LL_Video_20240222_hashed.csv','outbound/LL_20240222_hashed.csv');
content id can have multiple content names by adding year to the end (Managing a Diverse Team
Managing a Diverse Team (2023)).
no content ids for some of the content names
*/


INSERT INTO "PO_STAGE_DB"."ld".po_linkedin_learning_stage_hist
(
Employee_Email ,
Employee_User_Name ,
Content_Name ,
Content_Provider ,
Content_Type ,
Content_ID ,
Viewed_By_Hour ,
Percent_Completed ,
Start_Datetime ,
Last_Visit_Datetime ,
Completed_Datetime ,
Total_Assessment ,
Completed_Assessment ,
Skill ,
Video_Course_Name ,
Video_Course_ID ,
Time_Of_Group ,
Current_Group ,
Source_filename ,
lastdate 
)
select
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
METADATA$FILENAME,
METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE
(file_format => PO_STAGE_DB."Worker".csv_load_format,PATTERN => '.*LL_.*_hashed.*csv' ) t
 where METADATA$FILE_LAST_MODIFIED ::date = '2023-12-18'// change date 
;

update "PO_STAGE_DB"."ld".po_linkedin_learning_stage_hist 
set content_id = hash(content_id)
where content_id is null;

/*history load queries*/

create or replace temp table tt_ll_course as
Select 
EMPLOYEE_EMAIL,
EMPLOYEE_USER_NAME,
content_name,
content_provider,
content_type,
content_id,
percent_completed,
viewed_by_hour,
start_datetime, 
last_visit_datetime,
case when rk_as = 1 then ifnull(start_datetime::date,last_visit_datetime::date) else lag(last_visit_datetime::date+1) over (partition by EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id order by last_visit_datetime asc ) end as effective_date ,
case when rk_ds = 1 then '9999-12-31'::date else last_visit_datetime::date end as Exipiration_Date ,
completed_datetime,
skill,
video_course_name,
video_course_id,
time_of_group,
current_group
,Total_Assessment,Completed_Assessment
from
(Select 
EMPLOYEE_EMAIL,
EMPLOYEE_USER_NAME,
content_name,
content_provider,
content_type,
content_id,
percent_completed,
Total_Assessment,Completed_Assessment,
viewed_by_hour,
start_datetime, 
last_visit_datetime,
row_number() over(partition by EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id order by last_visit_datetime desc ) rk_ds,
row_number() over(partition by EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id order by last_visit_datetime asc ) rk_as,
completed_datetime,
skill,
video_course_name,
video_course_id,
time_of_group,
current_group
from
(
select distinct ls.EMPLOYEE_EMAIL,ls.EMPLOYEE_USER_NAME,ls.content_name,ls.content_provider,ls.content_type,ls.content_id,ls.percent_completed,ls.skill,ls.video_course_name,ls.video_course_id,coalesce(ls.time_of_group,current_group) as time_of_group,ls.current_group,std.start_datetime,max(Total_Assessment) as Total_Assessment,max(Completed_Assessment) as Completed_Assessment, 
sum(viewed_by_hour) as viewed_by_hour,max(to_timestamp(last_visit_datetime,'MM/DD/YY, HH12:MI PM')) as last_visit_datetime,max(to_timestamp(completed_datetime,'MM/DD/YY, HH12:MI PM')) as completed_datetime
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_hist ls
left join(
select distinct EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id,min(to_timestamp(start_datetime,'MM/DD/YY, HH12:MI PM')) as start_datetime
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_hist 
//where content_type = 'Course'
group by 1,2,3
) std on std.EMPLOYEE_EMAIL = ls.EMPLOYEE_EMAIL and ls.EMPLOYEE_USER_NAME = std.EMPLOYEE_USER_NAME and ls.content_id = std.content_id
//where ls.content_type = 'Course'
 group by 1,2,3,4,5,6,7,8,9,10,11,12,13//,14,15
)A
)b;



update tt_ll_course ll
set effective_date = case when exipiration_date = '9999-12-31' then last_visit_datetime_u::date+1 else effective_date end,
exipiration_date = case when exipiration_date <> '9999-12-31' then last_visit_datetime_u::date else exipiration_date end
from (select tt.employee_email,tt.content_id,max(last_visit_datetime) last_visit_datetime_u from tt_ll_course tt
inner join 
(select distinct employee_email,content_id from tt_ll_course where effective_date > Exipiration_Date)t on t.employee_email = tt.employee_email and t.content_id = tt.content_id
group by 1,2)b
where ll.employee_email = b.employee_email and ll.content_id = b.content_id;

insert into "PO_HRIS_DB"."ld".po_linkedin_learning
(
Employee_Email,
Employee_User_Name,
Content_Name,
Content_Provider,
Content_Type ,
Content_ID ,
Viewed_Hour ,
Percent_Completed ,
Start_Datetime ,
Last_Visit_Datetime ,
effective_date ,
expiration_Date ,
Completed_Datetime ,
Total_Assessment ,
Completed_Assessment ,
Skill ,
Video_Course_Name ,
Video_Course_ID ,
Time_Of_Group ,
Current_Group ,
Created_Date ,
Created_By ,
Modified_Date ,
Modifeid_By ,
Batch_ID 
)
select 
employee_email,
employee_user_name,
content_name,
content_provider,
content_type,
content_id,
viewed_by_hour,
percent_completed,
start_datetime, 
last_visit_datetime,
effective_date ,
exipiration_Date ,
completed_datetime,
Total_Assessment ,
Completed_Assessment ,
skill,
video_course_name,
video_course_id,
time_of_group,
current_group,
current_timestamp,
current_user,
current_timestamp,
current_user,
20240221
From  tt_ll_course;



//validation query 
select count(distinct content_name),content_id,employee_email from "PO_HRIS_DB"."ld".po_linkedin_learning  group by 2,3 having count(distinct content_name) > 1;

select distinct content_name from "PO_HRIS_DB"."ld".po_linkedin_learning where content_id  = '656779';

select * from "PO_HRIS_DB"."ld".po_linkedin_learning
where employee_email = 'b6d668b478c30c8d39260a8ea805801e6808c8062e74165b990504f7a2b5d93d80867aa4a59a50032abd13fe54d18723de81ec5eaa1aa732d95ca68cc6925b61' and content_id  = '656779';


select * from "PO_HRIS_DB"."ld".po_linkedin_learning 
where employee_email = '6b4f5aba3fe2adb933d3d6e0ccd144be1a7cb35fcb00b7dac4e77017dc7e0c500de8d3d53a3fe1ec4943c023064971f46a37e4b4e6067865d467202ec8ad325f' and content_id  = '784275';

select * from PO_HRIS_DB."ld".PO_HMM h
select * from PO_HRIS_DB."ld".PO_CBD_NUGGET

truncate table "PO_HRIS_DB"."ld".po_linkedin_learning;

select max(Last_Visit_Datetime), min(Last_Visit_Datetime) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_hist;

6b4f5aba3fe2adb933d3d6e0ccd144be1a7cb35fcb00b7dac4e77017dc7e0c500de8d3d53a3fe1ec4943c023064971f46a37e4b4e6067865d467202ec8ad325f 784275

706909
3006795
5030994
656779
3209252
2874195

656779	b6d668b478c30c8d39260a8ea805801e6808c8062e74165b990504f7a2b5d93d80867aa4a59a50032abd13fe54d18723de81ec5eaa1aa732d95ca68cc6925b61
;
select count(*), employee_email,content_id from "PO_HRIS_DB"."ld".po_linkedin_learning where expiration_date = '9999-12-31' group by 2,3 having count(*) > 1;

select max(last_visit_datetime) from "PO_HRIS_DB"."ld".po_linkedin_learning where effective_date>expiration_date   limit 10;


select count(*), employee_email,content_id from "PO_HRIS_DB"."ld".po_linkedin_learning group by 2,3 having count(*) > 1;


select employee_email,content_id,count(distinct start_datetime) from "PO_HRIS_DB"."ld".po_linkedin_learning where content_type = 'Course'  group by 1,2 having count(distinct start_datetime) > 1 limit 10;

create or replace temp table tmp_ll_pivot as
Select
distinct
(DATEADD(MS, Load_Datetime, '1970-01-01'))::datetime  as LOAD_DATETIME,
case 
when upper(Enterprise_Group) like '%NORTHAM%' then 'NORTHAM' 
when upper(Enterprise_Group) like '%APAC%' then 'APAC'
when upper(Enterprise_Group) like '%IT%' then 'IT'
else null 
end as Enterprise_Group,
REGEXP_SUBSTR(Profile_Url, '\\d+', 1, 1) AS Profile_ID,
REGEXP_SUBSTR(Profile_Url, '\\d+', 1, 2) AS Profile_DID,
Employee_Email,
Employee_User_Name,
Content_Provider,
Content_Name,
REGEXP_SUBSTR(content_url, '\\d+', 1, 1) AS Course_ID,
REGEXP_SUBSTR(content_url, '\\d+', 1, 2) AS Content_ID,
Content_Country,
Content_Language,
Asset_Type,
Engagement_Qualifier,
convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, First_Engaged_Dt, '1970-01-01'))) as First_Engaged_Dt, //Since UI dataextract is on PST converting timezone
Course_Name,
REGEXP_SUBSTR(content_url1, '\\d+', 1, 1) AS Video_Course_ID,
REGEXP_SUBSTR(content_url1, '\\d+', 1, 2) AS Video_Content_ID,
Source_Filename,
max(case when Engagement_Type = 'COMPLETIONS' then convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01'))) else null end) as completion_date,
max(CASE WHEN Engagement_Type = 'SECONDS_VIEWED' THEN engagement_value ELSE null END) as Viewed_Seconds,
max(case when Engagement_Type = 'PROGRESS_PERCENTAGE' then engagement_value else 0 end) as Percentage,
max(case when Engagement_Type = 'SECONDS_VIEWED' then convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01'))) else null end) as LAST_ENGAGED_DT,
max(null) as Number_Of_Assesments
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage 
where upper(ASSET_TYPE) = 'VIDEO'  
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
union all
Select
distinct
(DATEADD(MS, Load_Datetime, '1970-01-01'))::datetime  as LOAD_DATETIME,
case 
when upper(Enterprise_Group) like '%NORTHAM%' then 'NORTHAM' 
when upper(Enterprise_Group) like '%APAC%' then 'APAC'
when upper(Enterprise_Group) like '%IT%' then 'IT'
else null 
end as Enterprise_Group,
REGEXP_SUBSTR(Profile_Url, '\\d+', 1, 1) AS Profile_ID,
REGEXP_SUBSTR(Profile_Url, '\\d+', 1, 2) AS Profile_DID,
Employee_Email,
Employee_User_Name,
Content_Provider,
Content_Name,
REGEXP_SUBSTR(content_url, '\\d+', 1, 1) AS Course_ID,
REGEXP_SUBSTR(content_url, '\\d+', 1, 2) AS Content_ID,
Content_Country,
Content_Language,
'COURSE' as Asset_Type,
Engagement_Qualifier,
convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, First_Engaged_Dt, '1970-01-01'))) as First_Engaged_Dt, //Since UI dataextract is on PST converting timezone
Course_Name,
REGEXP_SUBSTR(content_url1, '\\d+', 1, 1) AS Video_Course_ID,
null AS Video_Content_ID,
Source_Filename,
max(case when Engagement_Type = 'COMPLETIONS' then convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01'))) else null end) as completion_date,
max(CASE WHEN Engagement_Type = 'SECONDS_VIEWED' THEN engagement_value ELSE NULL END) as Viewed_Seconds,
max(case when Engagement_Type = 'PROGRESS_PERCENTAGE' then engagement_value else 0 end) as Percentage,
max(case when Engagement_Type = 'SECONDS_VIEWED' then convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01'))) else null end) as LAST_ENGAGED_DT,
max(case when asset_type = 'ASSESSMENT' then engagement_value else null end) as Number_Of_Assesments
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage 
where upper(ASSET_TYPE) <> 'VIDEO' 
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
;


create or replace table tmp_ll_order as
select tl.employee_email,
tl.employee_user_name,
tl.content_name,
tl.content_provider,
tl.asset_type,
Current_date as Eff_dt,
'9999-12-31' as Exp_dt,
case when upper(tl.ASSET_TYPE) = 'VIDEO' then tl.content_id else tl.Course_ID end as content_id,
round((tl.viewed_seconds/3600),4) Viewed_Hour,
((tl.percentage::int)::char(12))||'%' as percentage,
TO_CHAR(TO_TIMESTAMP_NTZ(tl.first_engaged_dt), 'YYYY-MM-DD HH24:MI')::timestamp_ntz as first_engaged_dt,
TO_CHAR(TO_TIMESTAMP_NTZ(tl.last_engaged_dt), 'YYYY-MM-DD HH24:MI')::timestamp_ntz as last_engaged_dt,
TO_CHAR(TO_TIMESTAMP_NTZ(tl.completion_date), 'YYYY-MM-DD HH24:MI')::timestamp_ntz as completion_date,
null as total_assesments,
tl.number_of_assesments as completed_assesments,
null as skills,
null as course_name,
case when upper(tl.ASSET_TYPE) = 'VIDEO' then tl.Video_Course_ID else null end as  Video_Course_ID,
tl.enterprise_group,
source_filename
from tmp_ll_pivot tl left join "PO_HRIS_DB"."ld".po_linkedin_learning pll  on pll.employee_email = tl.employee_email 
and tl.content_id = pll.content_id
and pll.expiration_date = '9999-12-31' 
and TO_CHAR(TO_TIMESTAMP_NTZ(tl.last_engaged_dt), 'YYYY-MM-DD HH24:MI')::timestamp_ntz = pll.last_visit_datetime 
and pll.percent_completed = ((tl.percentage::int)::char(12))||'%' and 
pll.employee_email is null;
//limit 10
 ;

 select min(last_engaged_dt) from tmp_ll_order