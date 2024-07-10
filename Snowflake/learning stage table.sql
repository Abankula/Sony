CREATE OR REPLACE SCHEMA "PO_STAGE_DB"."ld"
COMMENT = 'learning and development data';

select count(*),employee_user_name,content_id from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_type = 'Course' group by 2,3 having count(*) > 1;

// why do we two different start dates?
select *
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where employee_user_name= 
'0cbc34fe074a3004e3a3b04c002c8f9ad1bdd63f70ffe0de7df08c13205395636d97ed6377bdc8756deba667a83b88d99c4dd7ee9c818a56e469629503b21528' 
//and last_visit_datetime  like '%00:59%'
and content_id = '700791'
order by to_timestamp(last_visit_datetime,'MM/DD/YY, HH:MI PM');

truncate table "PO_STAGE_DB"."ld".po_linkedin_learning_stage;

select distinct source_filename
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_id is null
employee_user_name= 
'36749a0aa8c4c11661e94ce2f9bf0963e22d06fbac7cabfb02b9d61d5258cc0a5d33fb6d587f4151ac1a57fa373ac802fd18a344b651e1a65158a918f2452adb' 
//and last_visit_datetime  like '%00:59%'
and content_id = '407834'
order by to_timestamp(last_visit_datetime,'MM/DD/YY, HH:MI PM');

5	36749a0aa8c4c11661e94ce2f9bf0963e22d06fbac7cabfb02b9d61d5258cc0a5d33fb6d587f4151ac1a57fa373ac802fd18a344b651e1a65158a918f2452adb	407834

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
case when rk_as = 1 then start_datetime::date else lag(last_visit_datetime) over (partition by EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id order by last_visit_datetime asc ) end as effective_date ,
case when rk_ds = 1 then '9999-12-31'::date else last_visit_datetime end as Exipiration_Date ,
completed_datetime,
skill,
video_course_name,
video_course_id,
time_of_group,
current_group

from

(Select 
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
select distinct ls.EMPLOYEE_EMAIL,ls.EMPLOYEE_USER_NAME,ls.content_name,ls.content_provider,ls.content_type,ls.content_id,ls.percent_completed,ls.skill,ls.video_course_name,ls.video_course_id,ls.time_of_group,ls.current_group,std.start_datetime, sum(viewed_by_hour) as viewed_by_hour,max(to_timestamp(last_visit_datetime,'MM/DD/YY, HH12:MI PM')) as last_visit_datetime,max(to_timestamp(completed_datetime,'MM/DD/YY, HH12:MI PM')) as completed_datetime

from "PO_STAGE_DB"."ld".po_linkedin_learning_stage ls
left join(
select distinct EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id,min(to_timestamp(start_datetime,'MM/DD/YY, HH12:MI PM')) as start_datetime
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where employee_user_name= 
'0cbc34fe074a3004e3a3b04c002c8f9ad1bdd63f70ffe0de7df08c13205395636d97ed6377bdc8756deba667a83b88d99c4dd7ee9c818a56e469629503b21528' 
and content_id = '700791'
and content_type = 'Course'
group by 1,2,3
) std on std.EMPLOYEE_EMAIL = ls.EMPLOYEE_EMAIL and ls.EMPLOYEE_USER_NAME = std.EMPLOYEE_USER_NAME and ls.content_id = std.content_id
where ls.employee_user_name= 
'0cbc34fe074a3004e3a3b04c002c8f9ad1bdd63f70ffe0de7df08c13205395636d97ed6377bdc8756deba667a83b88d99c4dd7ee9c818a56e469629503b21528' 
and ls.content_type = 'Course'
and ls.content_id = '700791' group by 1,2,3,4,5,6,7,8,9,10,11,12,13

)A)b;

//null employee username 
select * from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where 
employee_email<> 
'a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26' 
and employee_user_name= 
'a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26' 
and source_filename = 'outbound/LL_Video_20220530_hashed.csv'

;


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
case when rk_as = 1 then start_datetime::date else lag(last_visit_datetime::date+1) over (partition by EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id order by last_visit_datetime asc ) end as effective_date ,
case when rk_ds = 1 then '9999-12-31'::date else last_visit_datetime::date end as Exipiration_Date ,
completed_datetime,
skill,
video_course_name,
video_course_id,
time_of_group,
current_group
from
(Select 
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
select distinct ls.EMPLOYEE_EMAIL,ls.EMPLOYEE_USER_NAME,ls.content_name,ls.content_provider,ls.content_type,ls.content_id,ls.percent_completed,ls.skill,ls.video_course_name,ls.video_course_id,coalesce(ls.time_of_group,current_group) as time_of_group,ls.current_group,std.start_datetime, sum(viewed_by_hour) as viewed_by_hour,max(to_timestamp(last_visit_datetime,'MM/DD/YY, HH12:MI PM')) as last_visit_datetime,max(to_timestamp(completed_datetime,'MM/DD/YY, HH12:MI PM')) as completed_datetime
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage ls
left join(
select distinct EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id,min(to_timestamp(start_datetime,'MM/DD/YY, HH12:MI PM')) as start_datetime
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage 
//where content_type = 'Course'
group by 1,2,3
) std on std.EMPLOYEE_EMAIL = ls.EMPLOYEE_EMAIL and ls.EMPLOYEE_USER_NAME = std.EMPLOYEE_USER_NAME and ls.content_id = std.content_id
//where ls.content_type = 'Course'
 group by 1,2,3,4,5,6,7,8,9,10,11,12,13
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





















select * from tt_ll_course tt
inner join 
(select distinct employee_email,content_id from tt_ll_course where effective_date < Exipiration_Date and Exipiration_Date <> '9999-12-31')t on t.employee_email = tt.employee_email and t.content_id = tt.content_id
group by 1,2

select count(*),employee_email,content_id,percent_completed from tt_ll_course    group by 2,3,4 having count(*) > 1;

select *
from tt_ll_course 
where employee_email= 
'46f3c19d356c19cdae5db7e4f31ff14f877edea3107d8cd128df3228132ed10cb7f873624f388aebf63640e26259de7dbe9c02a582b1544f7e9ba7fbc1276aed' and content_id = '5ab01eae498e23703436522f';



select * //distinct EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id,min(to_timestamp(start_datetime,'MM/DD/YY, HH12:MI PM')) as start_datetime
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage 
where content_type = 'Video';



select count(*),employee_email,content_id from tt_ll_course  group by 2,3 having count(*) > 1;
d854b25f4ceae22021f39ac3838914bebe76b80613cb5d2784ead4f8859f8f4a7f1068cbdff14496bcef11f2f98a0b18fe6629edb45aee7d1b1b1f768bb8bcdb	746868
c8744d2c003c7f8520038abdf53f5c95ef8ad3580313b37410bfff49ed0c8467628a622828e014d03d2948ffd7cd59785c9082806c2d3dc9ded535fc511c5ae8	368915
729bb38874b20099c7b99a001481812d435363cbdc24ce2643be6c2c9ba2c354ca67d123725bba756567384f0e2f1848215f650722a2ef212b37f2ba77e6a1bf	5028508


select *
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where employee_email= 
'3c4209b5560d4caa5dc4d9f764fb1dcb7234e741a065e0b48032cbca5b1b8bfc592a85089eeab347de7f77bd628682c5c59a58642f03149596b77ecc329be484' 
and content_id = '802859'
and content_type = 'Course' 

select *
from tt_ll_course where employee_email= 
'3c4209b5560d4caa5dc4d9f764fb1dcb7234e741a065e0b48032cbca5b1b8bfc592a85089eeab347de7f77bd628682c5c59a58642f03149596b77ecc329be484' 
and content_id = '802859'
;
select *
from PO_HRIS_DB."Worker".PO_Worker_Snapshot ws //inner join (select distinct employee_email from "PO_HRIS_DB"."ld".po_linkedin_learning) ll on ws.email = ll.employee_email
where snapshot_dt = '2022-12-31' group by 2 having count(*) > 1
;

"PO_HRIS_DB"."ld".po_linkedin_learning


select *  //distinct employee_email,content_id 
from tt_ll_course where last_visit_datetime::date > effective_date



be314d87a9e7e602dffea48efc8c0e23e05747c094dd83606c69172aa5a99adc674d110d6034ae0b08fae93b7c2d249528e0c92b213f99183a59080e0c1a9a2d	642497
c8744d2c003c7f8520038abdf53f5c95ef8ad3580313b37410bfff49ed0c8467628a622828e014d03d2948ffd7cd59785c9082806c2d3dc9ded535fc511c5ae8	2848321


select distinct EMPLOYEE_EMAIL,EMPLOYEE_USER_NAME,content_id,min(start_datetime)
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where employee_user_name= 
'0cbc34fe074a3004e3a3b04c002c8f9ad1bdd63f70ffe0de7df08c13205395636d97ed6377bdc8756deba667a83b88d99c4dd7ee9c818a56e469629503b21528' 
//and last_visit_datetime  like '%00:59%'
and content_id = '700791' group by 1,2,3




//to get unique record for video content 
//Video content can have multiple content ids  
select video_course_name,skill,content_id,count (distinct video_course_id) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_type = 'Video' group by 1,2,3 having count (distinct video_course_id) > 1;

//to get unique record for course content 
//course content can have only one content id
select content_name,skill,count(distinct content_id) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_type = 'Course' group by 1,2 having count (distinct content_id) > 1;


select distinct video_course_id from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where video_course_name = 'Navigating Environmental Sustainability: A Guide for Leaders' and content_type = 'Video';


select video_course_id,employee_email ,count (distinct content_id ) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_type = 'Video' group by 1,2 having count (distinct content_id) > 1;

// same content name, but different ids? //Writing Articles Course
select * from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_id In ('2823292',
'2434208');



/**/
select video_course_name,video_course_id,employee_email,skill,count (distinct content_id) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_type = 'Video' group by 1,2,3,4 having count (distinct content_id) > 1;

SELECT * from "PO_STAGE_DB"."ld".po_linkedin_learning_stage WHERE video_course_id = '3097473' and employee_email= 
'fa5d34cec60693069036770c2e881713704cb3bc157ae5ff75a5d5fc2655bd83217882ea02a2dc4d522ba8ee0add600b30fe6a02f70dd0bfb1a2be09fa697113';

2848255
2873144

3097473	fa5d34cec60693069036770c2e881713704cb3bc157ae5ff75a5d5fc2655bd83217882ea02a2dc4d522ba8ee0add600b30fe6a02f70dd0bfb1a2be09fa697113
126132	f2b98f24df8821585aba035a46d346561c17f4f934c81ece43210e15a03057238d84e80fd8aca3d4ec948320f4fb25ce334072c6d85d2009a6c123e6f46e3aa2

select employee_email,content_id,count(distinct  to_timestamp(start_datetime,'MM/DD/YY, HH12:MI PM')::date) from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where content_type = 'Course' and percent_completed <> '0%' group by 1,2 having count(distinct  to_timestamp(start_datetime,'MM/DD/YY, HH12:MI PM')::date) > 1;



select to_timestamp(last_visit_datetime,'MM/DD/YY, HH12:MI PM'),last_visit_datetime as dd,viewed_by_hour*60,*
from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where employee_email= 
'f5dfe18a34e11b5360f6fcf821306f01a554acfd6fb29ddcb41dafa2a5ba902be8647b4c8781467bb86963f9e0f16f58e8574513bf65b1bd85b99e51ac91e483' 
//and last_visit_datetime  like '%00:59%'
//and content_id = '784481'
and content_id = '721901'
order by to_timestamp(last_visit_datetime,'MM/DD/YY, HH12:MI PM');

5f674f8e5031305908b566f2b2960fc7bf0b09e3d7a2d49e162ce49432eb8e50701d62164931c05c188256df5de95f856f0dc3cee983267ff21d70608e8284f3	628688
9e6e5b3c28a31b85d88b8c2e811b2a30ce9a5a297056f6c75c258ef045e06e88daad2b0b3d2be1b0928f8acd3b0211eebb1f4aa25f2e9c20e80f941848e18e29	784301
0debac9f1e8d53bea94339b71ca58bc11c659ef2b4d04cd5f5378625edfc00aed5c411c8e477f7e1a670eb33a7affa15b2ea226fb4f728270b1a828154d2f6ce	653257

select to_timestamp('11/8/20, 6:15 PM','MM/DD/YY, HH:MI PM')

SELECT * from "PO_STAGE_DB"."ld".po_linkedin_learning_stage WHERE employee_email = '71fb0064b1b66da5ebaa4a33fb1cf2e80df97e3a7400f22102d2e9331a40ee42d06fcfda062d1f425d3e208641bd071bb0eb3208c5bc6013c3cf3efc8683cacb' 
and CONTENT_ID = '4308001';

55f0167125da787b8bc69f342a7762c73cc854eb3cf229078f7c37f3f5cf94798a092b53969daf9b381c017fd34666c71096a545a29c34af3d70efbc87ff29c5	2be3973386ae7fc987deb9d9c7fac58a522c802e0d11035f77f4dd4780ceb68a3a68a488cca14b9a13eedb2b516c363269cb78aa3d852e1f885bdaba8cee4930	LinkedIn	The CEO Test: Mastering Leadership Challenges (Book Bite)	urn:li:lyndaCourse:2488253

SELECT distinct source_filename from "PO_HRIS_DB"."ld".po_linkedin_learning

select count(*) from
(select 
*
 from "PO_STAGE_DB"."ld".po_linkedin_learning_stage where Total_Assessment is not null)A

CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_linkedin_learning_stage
(
Employee_Email Varchar(128),
Employee_User_Name Varchar(128),
Content_Name Varchar,
Content_Provider Varchar,
Content_Type Varchar,
Content_ID Varchar(100),
Viewed_By_Hour Varchar(100),
Percent_Completed Varchar(100),
Start_Datetime Varchar(100),
Last_Visit_Datetime Varchar(100),
Completed_Datetime Varchar(100),
Total_Assessment Varchar(100),
Completed_Assessment Varchar(100),
Skill Varchar,
Video_Course_Name Varchar,
Video_Course_ID Varchar(100),
Time_Of_Group Varchar(100),
Current_Group Varchar(100),
Source_filename Varchar(100),
lastdate varchar
);

CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test
(
Load_Datetime Varchar(30),
Json_Url Varchar,
Enterprise_Group Varchar(100),
Profile_Url Varchar(200),
Employee_Email Varchar(128),
Employee_User_Name Varchar(128),
Content_Provider Varchar(100),
Content_Name Varchar,
Content_Url Varchar(200),
Content_Country Varchar(20),
Content_Language Varchar(10),
Engagement_Type Varchar(100),
Last_Engaged_Dt Varchar(100),
First_Engaged_Dt Varchar(100),
Asset_Type Varchar(20),
Engagement_Qualifier Varchar(100),
Engagement_Value Varchar(100),
Content_Provider1 Varchar(100),
Course_Name Varchar,
Content_Url1 Varchar(200),
Content_Country1 Varchar(20),
Content_Language1 Varchar(10),
Source_filename Varchar(100),
lastdate varchar
);

--old one
create or replace TABLE PO_STAGE_DB."ld".PO_LINKEDIN_LEARNING_STAGE_TEST (
	EMPLOYEE_EMAIL VARCHAR(128),
	EMPLOYEE_USER_NAME VARCHAR(128),
	CONTENT_NAME VARCHAR(16777216),
	CONTENT_TYPE VARCHAR(16777216),
	CONTENT_ID VARCHAR(100),
	ENGAGEMENT_TYPE VARCHAR(100),
	ENGAGEMENT_VALUE VARCHAR(100),
	START_DATETIME VARCHAR(100),
	LAST_VISIT_DATETIME VARCHAR(100),
	QUALIFIER VARCHAR(100),
	ENTERPRISE_GROUP VARCHAR(100),
	PROFILE VARCHAR(500),
	COUNTRY VARCHAR(100),
	LANGUAGE VARCHAR(100),
	SOURCE_FILENAME VARCHAR(100),
	LASTDATE VARCHAR(16777216)
);

copy into "PO_STAGE_DB"."ld".po_linkedin_learning_stage
from (select 
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
METADATA$FILENAME
,METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE )
pattern = '.*LL_20231219_hashed.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

truncate table "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test;
--old
copy into "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test
from (select 
$5,
$6,
$8,
$15,
$9,
$12,
$17,
$14,
$13,
$16,
$3,
$4,
$10,
$11,
METADATA$FILENAME
,METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE where METADATA$FILE_LAST_MODIFIED ::date = '2023-12-18' )
pattern = '.*LL_20231222_hashed.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;

--new
copy into "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test
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
pattern = '.*LL.*_20240206_hashed.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format'  TYPE = CSV ) 
;


select distinct Viewed_By_Hour from "PO_STAGE_DB"."ld".po_linkedin_learning_stage_test limit 10;

INSERT INTO "PO_STAGE_DB"."ld".po_linkedin_learning_stage
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
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE/LL_.*_hashed.csv  (file_format => PO_STAGE_DB."Worker".csv_load_format_skip ) t
where METADATA$FILE_LAST_MODIFIED ::date = '2023-12-18'

/*History Copy Script*/

INSERT INTO "PO_STAGE_DB"."ld".po_linkedin_learning_stage
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
METADATA$FILENAME
,METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE
(file_format => PO_STAGE_DB."Worker".csv_load_format,PATTERN => '.*LL_.*_hashed.*csv' ) t
 where METADATA$FILE_LAST_MODIFIED ::date = '2023-12-18'
;


select convert_timezone('GMT' ,'America/Los_Angeles','2024-02-03 00:56:00.000')--

select DATEADD(MS, $1, '1970-01-01'),
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
(DATEADD(MS, $13, '1970-01-01'))::datetime,
DATEADD(MS, $14, '1970-01-01'),
$13,
$14,
$15,
$16,
$17,
$18,
$19,
$20,
$21
METADATA$FILENAME
,METADATA$FILE_LAST_MODIFIED
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE
(file_format => PO_STAGE_DB."Worker".csv_load_format,PATTERN => '.*LL_Video_20240206_hashed.*csv' ) t
 where //$5 = '9cc1144cbeee7bdfb290e0025bf819e3f605b081ed43399bfcd54956435352cd7d0ec711dcde94d21fa7a94c3597dec186ec3a6972b1181a1836f72ad9834b78'
 
 $8 like '%Learn Windows 11%' and (DATEADD(MS, $13, '1970-01-01'))::date = '2024-02-02'
 
 METADATA$FILE_LAST_MODIFIED ::date = '2023-12-18'
;


 
CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_cloudguru_learning_stage
(
Employee_Email Varchar(50),
Content_Title Varchar(100),
Assessment_Pct Varchar(50),
Viewed_Minute Varchar(50),
Last_Visit_Date Varchar(50)

);

CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_hmm_stage
(
Content_Name Varchar(1000),
Employee_User_Name Varchar(128),
Employee_Email Varchar(128),
Visit_Count Varchar(100),
//Viewed_Minute Varchar(100),
Assessment_Score Varchar(100),
//Completed_Assessment Varchar(100),
//Assessment_Pct Varchar(100),
//Job1_Status Varchar(100),
//Job2_Status Varchar(100),
Completed_Date Varchar(100),
Region Varchar(100),
Division Varchar(100),
Department Varchar(500),
Source_Filename Varchar(500)

);

copy into "PO_STAGE_DB"."ld".po_hmm_learning_stage
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
METADATA$FILENAME
from @PO_STAGE_DB.PUBLIC.MY_S3_STAGE )
pattern = '.*HMM_2024.*csv'
FILE_FORMAT = (  FORMAT_NAME = 'PO_STAGE_DB."Worker".csv_load_format_pipe'  TYPE = CSV ) 


select m.* from "PO_STAGE_DB"."ld".po_hmm_stage m inner join 
(select count(*),Content_Name,employee_email from "PO_STAGE_DB"."ld".po_hmm_stage group by 2,3 having count(*) > 1) s on s.Content_Name =  m.Content_Name and s.employee_email = m. employee_email
order by m.employee_email,m.content_name
;

select *,completed_date::datetime from "PO_STAGE_DB"."ld".po_hmm_learning_stage where completed_date is null


CREATE OR REPLACE TABLE "PO_STAGE_DB"."ld".po_cbdngts_learning_stage
(
Employee_Email Varchar(50),
Category Varchar(50),
Skill Varchar(100),
Completed_Datetime Varchar(50)
);

select * from 

