SELECT
    EVENT_TIMESTAMP,
    USER_NAME,
    CLIENT_IP
FROM
    SNOWFLAKE.ACCOUNT_USAGE.LOGIN_HISTORY
WHERE
    EVENT_TIMESTAMP >= DATEADD(hour, -72, CURRENT_TIMESTAMP)
   // AND USER_NAME = 'specific_user'
ORDER BY
    EVENT_TIMESTAMP DESC;