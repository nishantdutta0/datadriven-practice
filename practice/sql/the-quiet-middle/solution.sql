WITH job_info AS (
  SELECT
    job_name,
    DENSE_RANK() OVER(ORDER BY rows_done DESC) AS rnk
  FROM batch_jobs
)

SELECT
  job_name,
  rnk
FROM job_info
WHERE rnk>=8 AND rnk<=10
ORDER BY rnk;
