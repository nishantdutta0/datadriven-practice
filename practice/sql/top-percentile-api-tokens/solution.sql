WITH ranked AS (
  SELECT
    token_id,
    scope,
    requests,
    PERCENT_RANK() OVER(PARTITION BY scope ORDER BY requests) AS pct_rank
  FROM api_tokens
)
  
SELECT
  token_id,
  scope,
  requests,
  ROUND(pct_rank,2) AS percentile_rank
FROM ranked
WHERE pct_rank >= 0.95
ORDER BY scope, requests, token_id;
