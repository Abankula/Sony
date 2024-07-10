SNOWFLAKEcreate user satableau
  PASSWORD = 'YZT0g3YvTrXpuf7'
  LOGIN_NAME = 'satableau'
  DISPLAY_NAME = 'Tableau SA'
  FIRST_NAME = 'Tableau'
  LAST_NAME = ''
  //EMAIL = 'PO_TABLEAU'
  DEFAULT_ROLE = 'PO_TABLEAU'
  DEFAULT_WAREHOUSE  = 'PO_WH'
  
 create role "PO_TABLEAU";

  
 create or replace user ldave
  LOGIN_NAME = 'dave_larue@spe.sony.com'
  DISPLAY_NAME = 'Dave Larue'
  FIRST_NAME = 'Dave'
  LAST_NAME = 'Larue'
  EMAIL = 'dave_larue@spe.sony.com'
  DEFAULT_ROLE = 'ACCOUNTADMIN'
  DEFAULT_WAREHOUSE  = 'PO_WH'


 create or replace user jrodriguez41
  LOGIN_NAME = 'josed_rodriguez@spe.sony.com'
  DISPLAY_NAME = 'Josed Rodriguez'
  FIRST_NAME = 'Josed'
  LAST_NAME = 'Rodriguez'
  EMAIL = 'josed_rodriguez@spe.sony.com'
  DEFAULT_ROLE = 'PO_ANALYST'
  DEFAULT_WAREHOUSE  = 'PO_WH'


grant usage on warehouse PO_WH to role "PO_ANALYST";

grant usage on database PO_HRIS_DB to role "PO_ANALYST";
grant usage on database TABLEAU to role "PO_ANALYST";
grant usage on database PO_HRIS_DB to role "PO_ANALYST";

grant usage on schema PO_HRIS_DB."ld" to role "PO_ANALYST";
grant select on all tables in schema PO_HRIS_DB."ld" to role "PO_ANALYST";
Grant role "QA_LD" to User tjones;
  
grant usage on warehouse PO_WH to role "QA_LD";
grant usage on database PO_HRIS_DB to role "QA_LD";
grant usage on schema PO_HRIS_DB."ld" to role "QA_LD";
grant select on all tables in schema PO_HRIS_DB."ld" to role "QA_LD";
Grant role "QA_LD" to User tjones;


  grant usage on warehouse PO_WH to role "PO_TABLEAU";

  grant usage on database TABLEAU to role "PO_TABLEAU";


GRANT USAGE ON SCHEMA TABLEAU."Exit" TO ROLE "PO_TABLEAU";
GRANT USAGE ON SCHEMA TABLEAU."PUBLIC" TO ROLE "PO_TABLEAU";
GRANT USAGE ON SCHEMA TABLEAU."candidate" TO ROLE "PO_TABLEAU";
GRANT USAGE ON SCHEMA TABLEAU."survey" TO ROLE "PO_TABLEAU";

GRANT USAGE ON SCHEMA PO_HRIS_DB."Application" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA PO_HRIS_DB."Calender" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA PO_HRIS_DB."PUBLIC" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA PO_HRIS_DB."Worker" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA PO_HRIS_DB."ld" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA PO_HRIS_DB."survey" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA PO_HRIS_DB."INFORMATION_SCHEMA" TO ROLE PO_ANALYST;

grant select on all tables in schema TABLEAU."Exit" TO ROLE "PO_TABLEAU";
grant select on all tables in schema TABLEAU."PUBLIC" TO ROLE "PO_TABLEAU";
grant select on all tables in schema TABLEAU."candidate" TO ROLE "PO_TABLEAU";
grant select on all tables in schema TABLEAU."survey" TO ROLE "PO_TABLEAU";

grant select on all views in schema TABLEAU."Exit" TO ROLE "PO_TABLEAU";
grant select on all views in schema TABLEAU."PUBLIC" TO ROLE "PO_TABLEAU";
grant select on all views in schema TABLEAU."candidate" TO ROLE "PO_TABLEAU";
grant select on all views in schema TABLEAU."survey" TO ROLE "PO_TABLEAU";

grant select on all views in schema PO_HRIS_DB."Application" TO ROLE PO_ANALYST;
grant select on all views in schema PO_HRIS_DB."Calender" TO ROLE PO_ANALYST;
grant select on all views in schema PO_HRIS_DB."PUBLIC" TO ROLE PO_ANALYST;
grant select on all views in schema PO_HRIS_DB."Worker" TO ROLE PO_ANALYST;
grant select on all views in schema PO_HRIS_DB."ld" TO ROLE PO_ANALYST;
grant select on all views in schema PO_HRIS_DB."survey" TO ROLE PO_ANALYST;

grant select on all views in schema TABLEAU."Exit" TO ROLE PO_ANALYST;
grant select on all views in schema TABLEAU."PUBLIC" TO ROLE PO_ANALYST;
grant select on all views in schema TABLEAU."candidate" TO ROLE PO_ANALYST;
grant select on all views in schema TABLEAU."survey" TO ROLE PO_ANALYST;

Grant role "PO_TABLEAU" to User satableau;

revoke role "PO_TABLEAU" from User satableau;


grant select on all tables in schema PO_HRIS_DB."ld" to role "QA_LD";


//GRANT USAGE ON SCHEMA TABLEAU."INFORMATION_SCHEMA" TO ROLE PO_TABLEAU;

GRANT USAGE ON SCHEMA TABLEAU."Exit" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA TABLEAU."PUBLIC" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA TABLEAU."candidate" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA TABLEAU."survey" TO ROLE PO_ANALYST;
GRANT USAGE ON SCHEMA TABLEAU."INFORMATION_SCHEMA" TO ROLE PO_ANALYST;

grant usage  all schema on database TABLEAU to role "PO_TABLEAU";

grant usage  all schema on database TABLEAU to role "PO_TABLEAU";
grant select on all tables in schema PO_HRIS_DB."ld" to role "QA_LD";

use database TABLEAU;
SELECT DISTINCT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_DATABASE_NAME = 'TABLEAU';


SELECT 
'GRANT USAGE ON SCHEMA ' ||CATALOG_NAME||'."' || SCHEMA_NAME || '" TO ROLE PO_ANALYST;' AS sql_statement
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_DATABASE_NAME = 'your_database';


SELECT 
'grant select on all tables in schema ' ||CATALOG_NAME||'."' || SCHEMA_NAME || '" TO ROLE PO_ANALYST;' AS sql_statement
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_DATABASE_NAME = 'your_database';




