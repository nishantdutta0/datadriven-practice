SELECT
  CASE 
    WHEN LOWER(err_type) LIKE '%timeout%' THEN 'timeout'
    WHEN LOWER(err_type) LIKE '%memory%' THEN 'memory'
    ELSE 'other'
  END AS error_category,
  COUNT(err_id) AS track_count
FROM err_tracks
GROUP BY error_category
ORDER BY error_category;
