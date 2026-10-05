SELECT 
  session_id,
  user_id,
  session_duration_sec
FROM user_sessions
WHERE EXTRACT(YEAR FROM session_start::DATE) = 2026
AND session_duration_sec < 100;
