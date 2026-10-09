SELECT 
  d.os_name,
  AVG(u.session_duration_sec) AS avg_duration
FROM user_sessions u
JOIN devices d
  ON u.device_id = d.device_id
WHERE d.device_type = 'mobile'
GROUP BY d.os_name
ORDER BY avg_duration DESC
LIMIT 1;
