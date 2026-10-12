SELECT
  d.device_type,
  AVG(u.session_duration_sec) AS avg_duration,
  MAX(u.session_duration_sec) AS max_duration,
  COUNT(u.session_id) AS session_count
FROM devices d
LEFT JOIN user_sessions u
  ON d.device_id = u.device_id
GROUP BY d.device_type
HAVING COUNT(u.session_id) >= 35
ORDER BY d.device_type;
