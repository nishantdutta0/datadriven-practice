WITH allocs AS (
SELECT
  svc_name,
  SUM(amount) AS total_allocs,
  COUNT(DISTINCT LOWER(team_name)) AS unique_teams
FROM cost_allocs
GROUP BY 1
),
costs AS (
SELECT
  svc_name,
  COUNT(*) AS billing_lines
FROM cloud_costs
GROUP BY 1
)

SELECT
  a.svc_name,
  ROUND((a.total_allocs * c.billing_lines) / a.unique_teams) AS budget_per_head
FROM allocs a
JOIN costs c 
  ON a.svc_name = c.svc_name
ORDER BY 1;
