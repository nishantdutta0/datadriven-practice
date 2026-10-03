WITH total_cost AS (
  SELECT
    region,
    TO_CHAR(bill_date, 'YYYY-MM') AS event_date,
    - SUM(amount) AS amt
  FROM cloud_costs
  GROUP BY region, event_date

  UNION ALL

  SELECT
    region,
    period AS event_date,
    SUM(amount) AS amt
  FROM cost_allocs
  GROUP BY region, event_date
),
net_cost AS (
  SELECT
    region,
    event_date,
    SUM(amt) AS amt
  FROM total_cost
  GROUP BY region, event_date
)

SELECT
  region,
  event_date,
  amt,
  SUM(amt) OVER (
    PARTITION BY region
    ORDER BY event_date
  ) AS running_balance
FROM net_cost
GROUP BY region, event_date
