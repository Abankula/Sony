BEGIN
  DELETE FROM emp;
EXCEPTION
  WHEN STATEMENT_ERROR THEN
    LET ERROR_MESSAGE := SQLCODE || ': ' || SQLERRM;
    INSERT INTO error_details VALUES (:ERROR_MESSAGE); -- Capture error details into a table.
    RAISE; -- Raise the same exception that you are handling.
END;
  return sqlrowcount;

  DECLARE
  query_id_1 VARCHAR;
  query_id_2 VARCHAR;
BEGIN
  SELECT 1;
  query_id_1 := SQLID;
  SELECT 2;
  query_id_2 := SQLID;
  RETURN [query_id_1, query_id_2];
END;

  
CREATE OR REPLACE TABLE "PO_HRIS_DB".PUBLIC.Auditevent
(
load_id Number,
table_name Varchar,
statement Varchar,
row_count number,
status Varchar,
date_time timestamp_ntz,
error_id number,
error_message Varchar,
batch_id Integer
);