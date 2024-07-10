read before 
*Always use employee email not employee username
*20240313 distinct 
/*
Based on file count =  2(video,normal) need to run the process
Check how to retrive path category data from linkedin api
curretly job is based on task--04/09
wrong load:
         step 1: update "PO_HRIS_DB"."ld".po_linkedin_learning 
set expiration_date = '9999-12-31'
where expiration_date = Current_date-1;
         step 2: delete effective date = curr dt
         
validate this before approve the table
         select * from  
"PO_HRIS_DB"."ld".po_linkedin_learning where
employee_email = 'da01837e09f74d8882b858f2ffd3b7f846fa169b29c7ffc9672b9ad2dbe91754935cdd7879ec291bfe582fcc7f751fa99078ed006ebf6abe3be0f88f895ff1c5'
and content_id = '3084735';
*/
select distinct batch_id//count(*),employee_email,content_id
from "PO_HRIS_DB"."ld".po_linkedin_learning where expiration_date = '9999-12-31' and effective_date <> '2024-03-14'  group by 2,3 having count(*) > 1


select distinct batch_id from PO_HRIS_DB."ld".PO_LINKEDIN_LEARNING_BKP20240222--
         select * from  
"PO_HRIS_DB"."ld".po_linkedin_learning where
employee_user_name = 'e3af98412e5117949c71145cce7733d6b8f49b1eea7600b1bcd85baa955b70aeb4e2e21543f6a9a974bd6cf1416d8fa0f466a1a7e2c01a53c71391620b424666'
and content_id = '379416';



34	e3af98412e5117949c71145cce7733d6b8f49b1eea7600b1bcd85baa955b70aeb4e2e21543f6a9a974bd6cf1416d8fa0f466a1a7e2c01a53c71391620b424666	3339087
34	e3af98412e5117949c71145cce7733d6b8f49b1eea7600b1bcd85baa955b70aeb4e2e21543f6a9a974bd6cf1416d8fa0f466a1a7e2c01a53c71391620b424666	3339083


//drop table "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test;
//drop table tmp_ll_order;
select  max(last_visit_datetime) from "PO_HRIS_DB"."ld".po_linkedin_learning where e

limit 1;--2024-03-14 23:58:00.000;

select * from  




select count(*) from  "PO_HRIS_DB"."ld".po_linkedin_learning where effective_date = '2024-04-09';

create or replace TABLE PO_STAGE_DB."ld".PO_LINKEDIN_LEARNING_STAGE_HIST (
	EMPLOYEE_EMAIL VARCHAR(128),
	EMPLOYEE_USER_NAME VARCHAR(128),
	CONTENT_NAME VARCHAR(16777216),
	CONTENT_PROVIDER VARCHAR(16777216),
	CONTENT_TYPE VARCHAR(16777216),
	CONTENT_ID VARCHAR(100),
	VIEWED_BY_HOUR VARCHAR(100),
	PERCENT_COMPLETED VARCHAR(100),
	START_DATETIME VARCHAR(100),
	LAST_VISIT_DATETIME VARCHAR(100),
	COMPLETED_DATETIME VARCHAR(100),
	TOTAL_ASSESSMENT VARCHAR(100),
	COMPLETED_ASSESSMENT VARCHAR(100),
	SKILL VARCHAR(16777216),
	VIDEO_COURSE_NAME VARCHAR(16777216),
	VIDEO_COURSE_ID VARCHAR(100),
	TIME_OF_GROUP VARCHAR(100),
	CURRENT_GROUP VARCHAR(100),
	SOURCE_FILENAME VARCHAR(100),
	LASTDATE VARCHAR(16777216)
);
truncate table PO_STAGE_DB."ld".PO_LINKEDIN_LEARNING_STAGE;

create or replace TABLE PO_STAGE_DB."ld".PO_LINKEDIN_LEARNING_STAGE (
	LOAD_DATETIME VARCHAR(30),
	JSON_URL VARCHAR(16777216),
	ENTERPRISE_GROUP VARCHAR(100),
	PROFILE_URL VARCHAR(200),
	EMPLOYEE_EMAIL VARCHAR(128),
	EMPLOYEE_USER_NAME VARCHAR(128),
	CONTENT_PROVIDER VARCHAR(100),
	CONTENT_NAME VARCHAR(16777216),
	CONTENT_URL VARCHAR(200),
	CONTENT_COUNTRY VARCHAR(20),
	CONTENT_LANGUAGE VARCHAR(10),
	ENGAGEMENT_TYPE VARCHAR(100),
	LAST_ENGAGED_DT VARCHAR(100),
	FIRST_ENGAGED_DT VARCHAR(100),
	ASSET_TYPE VARCHAR(20),
	ENGAGEMENT_QUALIFIER VARCHAR(100),
	ENGAGEMENT_VALUE VARCHAR(100),
	CONTENT_PROVIDER1 VARCHAR(100),
	COURSE_NAME VARCHAR(16777216),
	CONTENT_URL1 VARCHAR(200),
	CONTENT_COUNTRY1 VARCHAR(20),
	CONTENT_LANGUAGE1 VARCHAR(10),
	SOURCE_FILENAME VARCHAR(100),
	LASTDATE VARCHAR(100)
);
truncate table 
select distinct source_filename from "PO_STAGE_DB"."ld".po_linkedin_learning_stage;

INSERT INTO "PO_STAGE_DB"."ld".po_linkedin_learning_stage
(
	LOAD_DATETIME,
	JSON_URL,
	ENTERPRISE_GROUP,
	PROFILE_URL,
	EMPLOYEE_EMAIL,
	EMPLOYEE_USER_NAME,
	CONTENT_PROVIDER,
	CONTENT_NAME,
	CONTENT_URL ,
	CONTENT_COUNTRY,
	CONTENT_LANGUAGE,
	ENGAGEMENT_TYPE,
	LAST_ENGAGED_DT,
	FIRST_ENGAGED_DT,
	ASSET_TYPE ,
	ENGAGEMENT_QUALIFIER ,
	ENGAGEMENT_VALUE ,
	CONTENT_PROVIDER1 ,
	COURSE_NAME ,
	CONTENT_URL1 ,
	CONTENT_COUNTRY1 ,
	CONTENT_LANGUAGE1 ,
	SOURCE_FILENAME ,
	LASTDATE 

)

create or replace pipe PO_STAGE_DB."ld".p_linkedin_learning_load 
auto_ingest = true 
as
copy into "PO_STAGE_DB"."ld".po_linkedin_learning_stage
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
METADATA$FILENAME,
METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE)
pattern = 'LL.*_20240325_hashed.csv'
//pattern = 'LL_Video_.*.csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

select distinct source_filename from "PO_STAGE_DB"."ld".po_linkedin_learning_stage;
select max(convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01')))) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage limit 1;

truncate table "PO_STAGE_DB"."ld".po_linkedin_learning_stage;

SELECT SYSTEM$STREAM_HAS_DATA('po_linkedin_learning_stage');


/*stream for exit*/
create or replace stream "PO_STAGE_DB"."ld".S_LINKEDIN_LEARNING_LOAD
COPY GRANTS on table "PO_STAGE_DB"."ld".po_linkedin_learning_stage
APPEND_ONLY = TRUE
;


/*Task for Newhire*/
create or replace task PO_HRIS_DB."ld".t_linkedin_learning_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 20 13 * * * America/Chicago'
//Schedule = '1 Minute'
//when system$stream_has_data('"PO_STAGE_DB"."ld"."S_LINKEDIN_LEARNING_LOAD"')
as 
Call sp_linkedin_learning_load((to_char(current_date,'YYYYMMDD') )::int)
;
truncate table "PO_STAGE_DB"."survey".po_new_hire_survey_stage

alter task PO_HRIS_DB."ld".t_linkedin_learning_load resume;

select * from PO_HRIS_DB."ld".TMP_LL_ORDER
  from table(information_schema.task_history())
  order by scheduled_time;
  
show tasks
show streams;

alter task PO_HRIS_DB."survey".t_linkedin_learning_load resume;
alter task PO_HRIS_DB."survey".t_linkedin_learning_load suspend;


/*Task for Newhire*/
create or replace task PO_HRIS_DB."ld".t_linkedin_learning_load
Warehouse = po_wh
SCHEDULE = 'USING CRON 30 13 * * * America/Chicago'
//Schedule = '1 Minute'
//when system$stream_has_data('"PO_STAGE_DB"."ld"."S_LINKEDIN_LEARNING_LOAD"')
as 
Call sp_linkedin_learning_load ((to_char(current_date-25,'YYYYMMDD') )::int)
;


CREATE OR REPLACE PROCEDURE "PO_HRIS_DB"."ld".sp_linkedin_learning_load(FileDate int)
  RETURNS VARCHAR
  LANGUAGE SQL
  AS
  $$
  
declare
record_date date;
created_datetime timestamp;
modified_datetime timestamp;
created_by string;
modified_by string;
batch_id int;


begin


record_date := current_date();
created_datetime := current_timestamp(); 
modified_datetime := current_timestamp(); 
created_by := current_user();
modified_by :=  current_user();
select ((to_char(current_date -1,'YYYYMMDD') )::int) into batch_id;

truncate table "PO_STAGE_DB"."ld".po_linkedin_learning_stage;

let sel_statement:= 
'
INSERT INTO "PO_STAGE_DB"."ld".po_linkedin_learning_stage
(
	LOAD_DATETIME,
	JSON_URL,
	ENTERPRISE_GROUP,
	PROFILE_URL,
	EMPLOYEE_EMAIL,
	EMPLOYEE_USER_NAME,
	CONTENT_PROVIDER,
	CONTENT_NAME,
	CONTENT_URL ,
	CONTENT_COUNTRY,
	CONTENT_LANGUAGE,
	ENGAGEMENT_TYPE,
	LAST_ENGAGED_DT,
	FIRST_ENGAGED_DT,
	ASSET_TYPE ,
	ENGAGEMENT_QUALIFIER ,
	ENGAGEMENT_VALUE ,
	CONTENT_PROVIDER1 ,
	COURSE_NAME ,
	CONTENT_URL1 ,
	CONTENT_COUNTRY1 ,
	CONTENT_LANGUAGE1 ,
	SOURCE_FILENAME ,
	LASTDATE 

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
METADATA$FILENAME,
METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/LL_Video_'|| Filedate ||'_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t
union all
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
METADATA$FILENAME,
METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/LL_'|| Filedate ||'_hashed.csv (file_format => PO_STAGE_DB."Worker".csv_load_format ) t

'

;

execute immediate :sel_statement;



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
pll.employee_email is null;--null creates the process 
//limit 10
 ;


Update "PO_HRIS_DB"."ld".po_linkedin_learning pll
    set expiration_date =  Current_date-1,
    modified_date = :Modified_Datetime ,
    modifeid_by = :Modified_By 
from tmp_ll_order tl 
where pll.employee_email = tl.employee_email 
and tl.content_id = pll.content_id
and pll.expiration_date = '9999-12-31' 
;


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
//SOURCE_FILENAME,
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
asset_type,
content_id,
Viewed_Hour,
percentage,
first_engaged_dt,
last_engaged_dt,
eff_dt ,
exp_dt ,
completion_date,
total_assesments ,
completed_assesments ,
skills,
course_name,
Video_Course_ID,
enterprise_group,
null,
:Created_Datetime,
:Created_By ,
:Modified_Datetime ,
:Modified_By ,
:Batch_ID 
From  tmp_ll_order;




Return 'Done';

  END;
  $$;


  
select * from "PO_HRIS_DB"."ld".po_linkedin_learning where modified_date::date = current_date and created_date::date = modified_date::date;

content_id = '2891874'
and employee_email = '0d243a2da4e1f201544da533d04fe43550a8010522cd953b36bff04a877df3d2957460493ff86788f4c841782e05087ca5d5575d1267acb48d1e68d0ccc3e0b3'



select * from tmp_ll_order

 select round((242/3600),4)--0.0672
 convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, 1709170080000, '1970-01-01'))),

	
 1709169130044
 1709170080000
 
select count(*) from tmp_ll_order ;-766
 

 select distinct substr(last_visit_datetime, 1,7)  from "PO_HRIS_DB"."ld".po_linkedin_learning where content_type = 'Course';


select * from tmp_ll_order tl 
inner join 
"PO_HRIS_DB"."ld".po_linkedin_learning pll on pll.employee_email = tl.employee_email and tl.content_id = pll.content_id
where pll.expiration_date = '9999-12-31' 
and tl.last_engaged_dt > pll.last_visit_datetime 
and pll.percent_completed <> tl.percentage

and tl.video_course_id <> pll.video_course_id

//and last_engaged_dt is null and tl.employee_email = '2b1bd12543bde848c0ddbc53d740011dc53c9da26b849da56756008395078a5fce4b7251023527de3b475bbdd7fddeda80da8db058a3b8e4c77fdeb30bb5c441';



seconds/3600 = hours

select * from "PO_HRIS_DB"."ld".po_linkedin_learning where employee_email 
= '71fb0064b1b66da5ebaa4a33fb1cf2e80df97e3a7400f22102d2e9331a40ee42d06fcfda062d1f425d3e208641bd071bb0eb3208c5bc6013c3cf3efc8683cacb'
and content_id = '4308001'
;

select * from tmp_ll_pivot where employee_email 
= '2b1bd12543bde848c0ddbc53d740011dc53c9da26b849da56756008395078a5fce4b7251023527de3b475bbdd7fddeda80da8db058a3b8e4c77fdeb30bb5c441' and course_id = '4468308';


select *,REGEXP_SUBSTR(content_url, '\\d+', 1, 1) AS Course_ID,REGEXP_SUBSTR(content_url1, '\\d+', 1, 1) AS Video_Course_ID, from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where
employee_email 
= '9e394e3e92f86adc31cdb5fe77dc23191d9a48afe8d95f8d17c3e27ae3c6be076d2346569afbf4421664a9c3312ad0207df8d272c4bc3e0d88240d66ac1f4f1e' and source_filename = 'outbound/LL_20240306_hashed.csv'
and 
content_url like '%4586280%' and Video_Course_ID = Course_ID;


select * from "PO_HRIS_DB"."ld".po_linkedin_learning where employee_email 
= '9e394e3e92f86adc31cdb5fe77dc23191d9a48afe8d95f8d17c3e27ae3c6be076d2346569afbf4421664a9c3312ad0207df8d272c4bc3e0d88240d66ac1f4f1e'
and content_id = '4586280'


select *,REGEXP_SUBSTR(content_url, '\\d+', 1, 1) AS Course_ID,REGEXP_SUBSTR(content_url1, '\\d+', 1, 1) AS Video_Course_ID, from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where
employee_email 
= '0cc7a8a38736e8d3d3d578bbbf28a27af785d64234bf7753921f580521fb18e93ad71bdf0a4088bf245a954ed5ab1cf587699a82e95bfb463c92db1e93b6eb68'
and 
content_url like '%3097490%' and Video_Course_ID = Course_ID;



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
max(case when Engagement_Type = 'PROGRESS_PERCENTAGE' then engagement_value else null end) as Percentage,
max(case when Engagement_Type = 'PROGRESS_PERCENTAGE' then convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01'))) else null end) as LAST_ENGAGED_DT,
max(case when asset_type = 'ASSESSMENT' then engagement_value else null end) as Number_Of_Assesments
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage 
where upper(ASSET_TYPE) <> 'VIDEO' 
//and convert_timezone('GMT' ,'America/Los_Angeles',(DATEADD(MS, Last_Engaged_Dt, '1970-01-01')))::date = '2024-01-30' 
//and content_name like '%Structuring an effective presentation%'
//and content_name = 'Excel: Learning VBA'
//and video_course_id = '2883154'
//and content_url1 like '%126132%' 
//and Course_ID = Video_Course_ID  
//and employee_email = '2b1bd12543bde848c0ddbc53d740011dc53c9da26b849da56756008395078a5fce4b7251023527de3b475bbdd7fddeda80da8db058a3b8e4c77fdeb30bb5c441'
and Course_ID = '4586280'
group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
;

1699306080000
1695672671504
1699032720000	1697060011446

START_DATETIME	LAST_VISIT_DATETIME	COMPLETED_DATETIME
2023-09-25 13:03:00.000	2023-11-06 13:28:00.000	2023-09-25 13:11:00.000

select to_char(to_timestamp_ntz(1707033540000,3),'YYYY-MM-DD HH:MM:SS') from dual;
2024-02-04 07:02:00
 

select DATEADD(MS, 1706893920000, '1970-01-01')

select epoch(1699032720000)
2023-11-03 10:11:00

2023-11-03 17:32:00.000

START_DATETIME	LAST_VISIT_DATETIME
2023-10-11 14:33:00.000	2023-12-12 13:00:00.000

select DATEADD(MS, 1699032720000, 0::TIMESTAMP)  

//notes:
//all the course name and content name are interlinked and creating duplicates;

[{'engagementType': 'SECONDS_VIEWED', 'lastEngagedAt': 1706638740000, 'firstEngagedAt': 1706589874755, 'assetType': 'VIDEO', 'engagementMetricQualifier': 'TOTAL', 'engagementValue': 10}, {'engagementType': 'PROGRESS_PERCENTAGE', 'lastEngagedAt': 1706638740000, 'firstEngagedAt': 1706589874755, 'assetType': 'VIDEO', 'engagementMetricQualifier': 'TOTAL', 'engagementValue': 100}, {'engagementType': 'COMPLETIONS', 'lastEngagedAt': 1706589989339, 'firstEngagedAt': 1706589874755, 'assetType': 'VIDEO', 'engagementMetricQualifier': 'TOTAL', 'engagementValue': 1}]


content_name like '%Fundamentos de ITIL%'

Content_Language1 <> Content_Language limit 100;

 Select

Employee_Email,
Employee_User_Name,
asset_type,
Content_Provider,
Content_Provider1,
Content_Url,
Content_Url1,
Content_Country,
Content_Country1,
Content_Language,
Content_Language1
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test where Content_Country <> Content_Country1 ;limit 100;

select distinct SOURCE_FILENAME from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test where upper(ASSET_TYPE) <> 'VIDEO' and Course_Name = 'Excel: Learning VBA';
'

select *
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test 
where upper(ASSET_TYPE) = 'VIDEO' 
and course_name like '%Push past your social comfort zone%'

create table "PO_HRIS_DB"."ld".po_linkedin_learning_bkp20240222 as;
select * from "PO_HRIS_DB"."ld".po_linkedin_learning limit 10;
