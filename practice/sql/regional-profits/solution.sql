SELECT 
  region,
  SUM(profit) AS total_profit,
  COUNT(*) AS order_count
FROM orders
WHERE region IS NOT NULL
GROUP BY region
ORDER BY total_profit DESC;
