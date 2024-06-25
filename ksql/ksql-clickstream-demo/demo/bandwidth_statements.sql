-- Bandwidth per user session
CREATE TABLE BANDWIDTH_USER_SESSIONS AS
    SELECT
        username as K,
        AS_VALUE(username) as username,
        WINDOWEND as EVENT_TS,
        SUM(bytes) AS bandwidth
    FROM USER_CLICKSTREAM window SESSION (30 second)
    GROUP BY username;

-- High bandwidth user sessions
CREATE TABLE HIGH_BANDWIDTH_USER_SESSIONS AS
    SELECT 
        username AS K,
        AS_VALUE(username) as username,
        WINDOWEND as EVENT_TS,
        SUM(bytes) AS bandwidth
    FROM USER_CLICKSTREAM 
    WINDOW SESSION (30 SECONDS) 
    GROUP BY username
    HAVING SUM(bytes) > 102400; -- more than 100 Kbs
