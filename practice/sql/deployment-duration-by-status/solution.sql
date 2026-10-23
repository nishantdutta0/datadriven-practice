SELECT
  LOWER(TRIM(svc_name)) AS svc_name,
  LOWER(TRIM(status)) AS status,
  SUM(dur_secs) AS total_duration
FROM deploy_logs
GROUP BY LOWER(TRIM(svc_name)), LOWER(TRIM(status))
ORDER BY svc_name
