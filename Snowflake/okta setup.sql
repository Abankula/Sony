use warehouse PO_WH;
DESC SECURITY INTEGRATION SPEPIA_PO_OKTA_INTEGRATION;

Step 1:
create security integration spepia_po_okta_integration

type = saml2 

enabled = true 

saml2_issuer = 'http://www.okta.com/exkv5asyzc3nL0AM2357' 

saml2_sso_url = 'https://login.spe.sony.com/app/snowflake/exkv5asyzc3nL0AM2357/sso/saml'

--'https://login.spe.sony.com/app/snowflake/exkv5asyzc3nL0AM2357/sso/saml'
saml2_provider = 'OKTA' 

saml2_x509_cert= 'MIIDljCCAn6gAwIBAgIGAYodpQkHMA0GCSqGSIb3DQEBCwUAMIGLMQswCQYDVQQGEwJVUzETMBEG A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU MBIGA1UECwwLU1NPUHJvdmlkZXIxDDAKBgNVBAMMA3NwZTEcMBoGCSqGSIb3DQEJARYNaW5mb0Bv a3RhLmNvbTAeFw0yMzA4MjIxNDI2NDlaFw0zMzA4MjIxNDI3NDlaMIGLMQswCQYDVQQGEwJVUzET MBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0 YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxDDAKBgNVBAMMA3NwZTEcMBoGCSqGSIb3DQEJARYNaW5m b0Bva3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMryFiCgzjcMbtg40ZxO NPV6xKHMQYAb1MxVIvR++1Fd1Q+WfBXeAgYMSGvL4qZGcpFJORC2+PwZfi+KIJlcnQtrX+MEzFAm VDEH38K6o5mEV5PZBTduoBmjgpEThKmO6zGUXQswmXKQgJXCN9ljyawuWuRmTyqHYmT7+hc7CJRX Y7UniJjBIabUgNovr0RKoXv7K/jvXQI8+R7yFOqacVof58+s3qTdlZ5tX0FaFwKdytkca1JepDF5 rlV9mv1idAv5LDsNxul5ySrKmu+cyOE9ZCcZ/plDSM6u672M+JsDDGgDEL/8yoByktqX1s1B7yrU P3wbYlkYYLEqxm6HQc8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAgKZvrVb5icFdqE5JdAQ8Xzn2 9jhgPGwSlEf2tKLdlp68knUmgJmfO3zzZ7386hF8nIm/n1FKYAAI/Tdc/EVmswuvl3kSX11ag4ug cbvGxYyCPfCgC4NYAjVtNgB+yDtaqGkd/Li1DlCLTT/6HMKtX0X12v3UwZRQbvRvP0nE3C3S5PRV GbrvO+oivjlVRE0SX7DHu5+3kSAV4ZkgNT6Z7Oy8MyOmm5yZqb8uF6QMOV8twwYh7Z8Al2aSOMwC OTdN1tWDgVzKCptgJowyuhP2gXjtrInd1lwDQ5JT4kj97VIrLhMvKJWaPzaBqP61MFu5XYjmFb5I DfUmX+ajYe+2Pw=='

saml2_sp_initiated_login_page_label = 'OKTASSO'

saml2_enable_sp_initiated = true;


saml2_snowflake_issuer_url = 'https://spepia.snowflakecomputing.com';

Step 2:
alter security integration spepia_po_okta_integration set saml2_snowflake_acs_url = 'https://spepia.snowflakecomputing.com/fed/login'
alter security integration spepia_po_okta_integration set saml2_snowflake_issuer_url = 'https://spepia.snowflakecomputing.com';

alter user abankula
set password = 'peace@InspiratioN980263';
--set login_name = 'abhilash_bankula@spe.sony.com'
desc user ssumitha
--Create User
create user ssumitha
  PASSWORD = 'Tableauuser@1'
  LOGIN_NAME = 'susmitha_kanneganti@spe.sony.com'
  DISPLAY_NAME = 'Susmitha Kanneganti'
  FIRST_NAME = 'Susmitha'
  LAST_NAME = 'Kanneganti'
  EMAIL = 'susmitha_kanneganti@spe.sony.com'
  DEFAULT_ROLE = 'SECURITYADMIN'
  DEFAULT_WAREHOUSE  = 'PO_WH'


    create user admin_qa
  PASSWORD = 'Snowflake@1'
  LOGIN_NAME = 'admin_qa'
  DISPLAY_NAME = 'Abhilash Test'
  FIRST_NAME = 'Abhilash'
  LAST_NAME = 'Test'

  DEFAULT_ROLE = 'PO_QA'
  DEFAULT_WAREHOUSE  = 'PO_WH'

  create user llaura
  PASSWORD = 'Snowflake@1'
  LOGIN_NAME = 'laura_lewis@spe.sony.com'
  DISPLAY_NAME = 'Laura Lewis'
  FIRST_NAME = 'Laura'
  LAST_NAME = 'Lewis'
  EMAIL = 'laura_lewis@spe.sony.com'
  DEFAULT_ROLE = 'SYSADMIN'
  DEFAULT_WAREHOUSE  = 'PO_WH'

 create user jrodriguez41
 // PASSWORD = 'Snowflake@4'
  LOGIN_NAME = 'josed_rodriguez@spe.sony.com'
  DISPLAY_NAME = 'Josed Rodriguez'
  FIRST_NAME = 'Josed'
  LAST_NAME = 'Rodriguez'
  EMAIL = 'josed_rodriguez@spe.sony.com'
  DEFAULT_ROLE = 'PO_QA'
  DEFAULT_WAREHOUSE  = 'PO_WH'

  
create user mlaura
 // PASSWORD = 'Snowflake@4'
  LOGIN_NAME = 'laura_mcaliley@spe.sony.com'
  DISPLAY_NAME = 'Laura Mcaliley'
  FIRST_NAME = 'Laura'
  LAST_NAME = 'Mcaliley'
  EMAIL = 'laura_mcaliley@spe.sony.com'
  DEFAULT_ROLE = 'PO_QA'
  DEFAULT_WAREHOUSE  = 'PO_WH'


create user tedwin
 // PASSWORD = 'Snowflake@4'
  LOGIN_NAME = 'edwin_tang@spe.sony.com'
  DISPLAY_NAME = 'Tang Edwin'
  FIRST_NAME = 'Edwin'
  LAST_NAME = 'Tang'
  EMAIL = 'edwin_tang@spe.sony.com'
  DEFAULT_ROLE = 'QA_LD'
  DEFAULT_WAREHOUSE  = 'PO_WH';

 create user mlaura

  LOGIN_NAME = 'laura_mcaliley@spe.sony.com'
  DISPLAY_NAME = 'Laura Mcaliley'
  FIRST_NAME = 'Laura'
  LAST_NAME = 'Mcaliley'
  EMAIL = 'laura_mcaliley@spe.sony.com'
  DEFAULT_ROLE = 'PO_QA'
  DEFAULT_WAREHOUSE  = 'PO_WH';

  create user tjones
 // PASSWORD = 'Snowflake@4'
  LOGIN_NAME = 'taimah_jones@spe.sony.com'
  DISPLAY_NAME = 'Jones Taimah'
  FIRST_NAME = 'Taimah'
  LAST_NAME = 'Jones'
  EMAIL = 'taimah_jones@spe.sony.com'
  DEFAULT_ROLE = 'QA_LD'
  DEFAULT_WAREHOUSE  = 'PO_WH';

  
create role "QA_LD";  
grant role "QA_LD" to role "PO_QA";  
grant usage on warehouse PO_WH to role "QA_LD";
grant usage on database PO_HRIS_DB to role "QA_LD";
grant usage on schema PO_HRIS_DB."ld" to role "QA_LD";
grant select on all tables in schema PO_HRIS_DB."ld" to role "QA_LD";
Grant role "QA_LD" to User tjones;


drop user tedwin;

Create role "PO_ADMIN";
grant role "PO_ADMIN" to role "SECURITYADMIN";-- Praneesh, David

create role "PO_DEV";
grant role "PO_DEV" to role "PO_ADMIN";

create role "PO_ANALYST";
grant role "PO_ANALYST" to role "PO_ADMIN";  
  
create role "PO_QA";
grant role "PO_QA" to role "PO_ANALYST";  

Grant role "PO_QA" to User mlaura;

grant All privileges on warehouse "PO_WH" to role "SECURITYADMIN";
grant All privileges on database "TABLEAU" to role "SECURITYADMIN";
grant All privileges on schema Application to role "PO_QA";


grant usage on database PO_HRIS_DB to role "PO_QA";

grant usage on database PO_STAGE_DB to role "PO_QA";

grant all privileges on all tables in schema TABLEAU."Application" to role "SECURITYADMIN";

grant all privileges on all tables in schema PO_HRIS_DB."Application" to role "SECURITYADMIN";
grant all privileges on all tables in schema PO_HRIS_DB."Calender" to role "SECURITYADMIN";
grant all privileges on all tables in schema PO_HRIS_DB."PUBLIC" to role "SECURITYADMIN";
grant all privileges on all tables in schema PO_HRIS_DB."Worker" to role "SECURITYADMIN";
grant all privileges on all tables in schema PO_HRIS_DB."ld" to role "SECURITYADMIN";
grant all privileges on all tables in schema PO_HRIS_DB."survey" to role "SECURITYADMIN";

grant usage on schema PO_HRIS_DB."Application" to role "PO_QA";
grant usage on schema PO_HRIS_DB."Calender" to role "PO_QA";
grant usage on schema PO_HRIS_DB."PUBLIC" to role "PO_QA";
grant usage on schema PO_HRIS_DB."Worker" to role "PO_QA";
grant usage on schema PO_HRIS_DB."ld" to role "PO_QA";
grant usage on schema PO_HRIS_DB."survey" to role "PO_QA";

use role securityadmin;
use warehouse PO_WH;

grant select on all tables in schema PO_HRIS_DB."Application" to role "PO_QA";
grant select on all tables in schema PO_HRIS_DB."Calender" to role "PO_QA";
grant select on all tables in schema PO_HRIS_DB."PUBLIC" to role "PO_QA";
grant select on all tables in schema PO_HRIS_DB."Worker" to role "PO_QA";
grant select on all tables in schema PO_HRIS_DB."ld" to role "PO_QA";
grant select on all tables in schema PO_HRIS_DB."survey" to role "PO_QA";


grant select on all tables in schema PO_STAGE_DB."PUBLIC" to role "PO_QA";
grant select on all tables in schema PO_STAGE_DB."Worker" to role "PO_QA";
grant select on all tables in schema PO_STAGE_DB."ld" to role "PO_QA";
grant select on all tables in schema PO_STAGE_DB."survey" to role "PO_QA";

grant usage on schema TABLEAU."Exit" to role "PO_QA";
grant usage on schema PO_STAGE_DB."Worker" to role "PO_QA";
grant usage on schema PO_STAGE_DB."ld" to role "PO_QA";
grant usage on schema PO_STAGE_DB."survey" to role "PO_QA";


grant usage on schema TABLEAU."Exit" to role "PO_QA";
grant select on all views in schema TABLEAU."PUBLIC" to role "PO_QA";

grant usage on schema TABLEAU."candidate" to role "PO_QA";
grant select on all tables in schema TABLEAU."Exit" to role "PO_QA";

select * from TABLEAU."candidate".VW_JOB_REQ where requisition_id = 'JR23-11302'

derived_last_stage is null

drop view TABLEAU."survey".DAY90_NEW_HIRE_SURVEY

CREATE SCHEMA "TABLEAU"."survey"
COMMENT = 'employee survey data';

CREATE SCHEMA "TABLEAU"."candidate"
COMMENT = 'Job Req data';

drop schema "TABLEAU"."req"


select * from PO_HRIS_DB."ld".PO_HMM;

Grant role "PO_QA" to User llaura;


alter user llaura
set MUST_CHANGE_PASSWORD = TRUE

password = 'Tableauuser@2';

use role securityadmin;

 /* MUST_CHANGE_PASSWORD = TRUE | FALSE
  DISABLED = TRUE | FALSE
  DAYS_TO_EXPIRY = <integer>
  MINS_TO_UNLOCK = <integer>
  DEFAULT_WAREHOUSE = <string>
  DEFAULT_NAMESPACE = <string>
  DEFAULT_ROLE = <string>
  DEFAULT_SECONDARY_ROLES = ( 'ALL' )
  MINS_TO_BYPASS_MFA = <integer>
  RSA_PUBLIC_KEY = <string>
  RSA_PUBLIC_KEY_2 = <string>
  COMMENT = '<string_literal>';
*/
  drop table PO_HRIS_DB."ld".PO_CSTONE_LEARNING

 show users;
snowsql --authenticator http://www.okta.com/exkv5asyzc3nL0AM235 -r public -a abankula -u <name>@<domain>.com
http://www.okta.com/exkv5asyzc3nL0AM2357

select * 
from PO_HRIS_DB."Application".PO_WD_APPLICATION 
where application_id = '3-1304312'  limit 1;

select * from PO_HRIS_DB."Worker".PO_WORKER_SNAPSHOT limit 10;

select * from PO_HRIS_DB."Application".PO_WD_REQUISITION limit 10;
select * from PO_HRIS_DB."Application".PO_WD_CANDIDATE where candidate_id = 'bab99fb082c19d12fcebfaff0741edf4c642a9192cbfd17f751372a1417a7550582e6cacd70a70c70a1a4a1c6ede171af6b07d9e381909ed2f9840a4dc99a014'
inner join  
limit 10;


drop table PO_HRIS_DB."Worker".PO_WD_COMPENSATION;
drop table PO_HRIS_DB."Worker".PO_WD_EE_CONFIDENTIAL;
drop table PO_HRIS_DB."Worker".PO_WD_JOB;
drop table PO_HRIS_DB."Worker".PO_WD_ORGANIZATION;
drop table PO_HRIS_DB."Worker".PO_WD_EMPLOYEE;


