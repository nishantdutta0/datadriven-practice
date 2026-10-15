WITH product_info AS (
  SELECT
    p.category,
    p.product_id,
    p.product_name,
    SUM(t.total_amount) AS total_revenue
  FROM transactions t
  JOIN products p
    ON t.product_id = p.product_id
  WHERE transaction_date >= '2026-01-01' AND transaction_date < '2027-01-01'
  GROUP BY 1,2,3
),
ranked_products AS (
  SELECT 
    category,
    product_name,
    total_revenue,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_revenue DESC, product_name) AS rnk
  FROM product_info
)
  
SELECT
  category,
  product_name,
  total_revenue
FROM ranked_products
WHERE rnk = 1
ORDER BY total_revenue DESC;
