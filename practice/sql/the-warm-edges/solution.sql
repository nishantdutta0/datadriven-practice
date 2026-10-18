WITH cache_info AS (
SELECT
  edge_loc,
  req_path,
  cache_hit,
  SUM(bytes) OVER(PARTITION BY edge_loc) AS total_bytes
FROM cdn_logs
WHERE req_path LIKE '%api%'
)

SELECT DISTINCT
  edge_loc,
  req_path,
  total_bytes
FROM cache_info 
WHERE cache_hit = 1
ORDER BY 3;
