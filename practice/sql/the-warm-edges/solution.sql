WITH cache_info AS (
SELECT
  edge_loc,
  req_path,
  cache_hit,
  SUM(bytes) OVER(PARTITION BY edge_loc) AS total_bytes
FROM cdn_logs
WHERE req_path LIKE '%api%'
ORDER BY 3
)

SELECT DISTINCT
  edge_loc,
  req_path,
  total_bytes
FROM cache_info 
WHERE cache_hit = 1
ORDER BY total_bytes;
-- SELECT * FROM cdn_logs WHERE edge_loc = 'LHR'
