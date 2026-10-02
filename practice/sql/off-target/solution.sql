SELECT
  model_id,
  mdl_name,
  train_at::DATE AS train_date,
  accuracy,
  ABS(accuracy - 0.95) AS accuracy_gap,
  NTILE(10) OVER(ORDER BY ABS(accuracy - 0.95),model_id) AS tenth
FROM ml_models
WHERE train_at::DATE >= '2026-01-01' AND train_at::DATE <= '2026-04-04' 
AND accuracy IS NOT NULL;

-- You need a filtering technique that applies *after* you've computed 
-- your derived columns, so you can validate that accuracy itself falls 
-- within a valid range, not just the date window.
