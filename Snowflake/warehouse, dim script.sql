Alter WAREHOUSE IDENTIFIER('"PO_WH"') 
set COMMENT = 'Intial Warehouse' 
WAREHOUSE_SIZE = 'X-Small' 
AUTO_SUSPEND = 300 
AUTO_RESUME = true 
ENABLE_QUERY_ACCELERATION = false 
WAREHOUSE_TYPE = 'STANDARD'
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 2 
SCALING_POLICY = 'ECONOMY'
;

CREATE OR REPLACE WAREHOUSE PO_ETL
WAREHOUSE_SIZE = 'X-Small' 
AUTO_SUSPEND = 300 
AUTO_RESUME = true 
ENABLE_QUERY_ACCELERATION = false 
WAREHOUSE_TYPE = 'STANDARD'
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 2 
SCALING_POLICY = 'ECONOMY'
;


CREATE OR REPLACE TABLE Dim_Date as (
WITH CTE_MY_DATE AS (
SELECT DATEADD(DAY, SEQ4(), '1990-01-01 00:00:00') AS MY_DATE
FROM TABLE(GENERATOR(ROWCOUNT=>20000))
)

SELECT
TO_DATE(MY_DATE) as date
,YEAR(MY_DATE) as year
,MONTH(MY_DATE) as month
,MONTHNAME(MY_DATE) as monthname
,DAY(MY_DATE) as day
,DAYOFWEEK(MY_DATE) as dayofweek
,WEEKOFYEAR(MY_DATE) as weekofyear
,DAYOFYEAR(MY_DATE) as dayofyear
,YEAR(DATEADD(YEAR,case when month(date(MY_DATE)) >= 4 THEN +1 ELSE 0 END, MY_DATE)) as FISCAL_YEAR
,case when month(date(MY_DATE)) between 4 and 6 THEN 1 
when month(date(MY_DATE)) between 7 and 9 THEN 2 
when month(date(MY_DATE)) between 10 and 12 THEN 3 
when month(date(MY_DATE)) between 1 and 3 THEN  4
ELSE 0 END as Fiscal_Quarter
,concat('FY ',FISCAL_YEAR) || concat(' Q',Fiscal_Quarter) as FY_Quarter 
,case when last_day(MY_DATE) = MY_DATE then 1 else 0 end as Month_End
, case when MY_DATE like '%03-31%' then 1 
when MY_DATE like '%06-30%' then 1 
when MY_DATE like '%09-30%' then 1 
when MY_DATE like '%12-31%' then 1 else 0 end as Quarter_End
FROM CTE_MY_DATE
);



SELECT current_date today,
    date_trunc('quarter', today) as cur_qrt,
    dateadd('day', -1, cur_qrt) as last_day_of_prior_qrt,
    dateadd('day', -1, dateadd('quarter', 1, MY_DATE)) as last_day_of_current_qrt;
    
select 
 CASE
    WHEN EXTRACT(MONTH FROM '2017-04-01'::Date) >= 4 THEN
      TO_VARIANT(EXTRACT(YEAR FROM '2017-04-01'::Date) || '-' || (EXTRACT(YEAR FROM '2017-04-01'::Date)) + 1)
    ELSE
      TO_VARIANT((EXTRACT(YEAR FROM '2017-04-01'::Date)) - 1) || '-' || EXTRACT(YEAR FROM '2017-04-01'::Date)
  END

select YEAR(DATEADD(YEAR,case when month(date('2017-04-01'::Date)) >= 4 THEN +1 ELSE 0 END, '2017-04-01'::Date)) as FISCAL_YEAR,
case when month(date('2017-04-01'::Date)) between 4 and 6 THEN 1 
when month(date('2017-04-01'::Date)) between 7 and 9 THEN 2 
when month(date('2017-04-01'::Date)) between 10 and 12 THEN 3 
when month(date('2017-04-01'::Date)) between 1 and 3 THEN  4
ELSE 0 END as FY_Quarter
;


 select * from PO_HRIS_DB."Calender".DIM_DATE where Quarter_end =  1 and date >='2010-01-01'


SELECT SYSTEM$GET_SNOWFLAKE_PLATFORM_INFO();

{"snowflake-vpc-id":["vpc-060574be480de31db"]}