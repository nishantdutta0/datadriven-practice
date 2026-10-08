WITH first_session AS (
SELECT
  user_id,
  DATE(MIN(session_start)) AS first_session_date
FROM user_sessions
GROUP BY 1
)

SELECT 
  first_session_date,
  COUNT(*) AS new_user_count
FROM first_session
GROUP BY 1
ORDER BY 1
