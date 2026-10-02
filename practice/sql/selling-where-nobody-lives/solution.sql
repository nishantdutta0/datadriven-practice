SELECT 
  DISTINCT region
FROM orders
WHERE (LOWER(status) = 'shipped' OR LOWER(status) = 'completed') AND profit > 1200 AND region IS NOT NULL;;
