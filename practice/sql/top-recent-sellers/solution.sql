SELECT 
  product_id,
  SUM(total_amount) OVER(PARTITION BY product_id) AS total_sales
FROM transactions
WHERE transaction_date >= '2026-10-03'- INTERVAL '30 days' 
GROUP BY product_id
ORDER BY total_sales DESC, product_id
LIMIT 3;
