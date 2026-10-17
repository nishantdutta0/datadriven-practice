SELECT
  DISTINCT metric_value
FROM employee_metrics
QUALIFY RANK() OVER(ORDER BY metric_value DESC) <= 5;
