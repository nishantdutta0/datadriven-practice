WITH completed_jobs AS (
    SELECT
        job_id,
        MIN(started) AS start_time,
        MAX(ended) AS end_time
    FROM batch_jobs
    WHERE LOWER(status) = 'completed'
      AND started IS NOT NULL
      AND ended IS NOT NULL
    GROUP BY job_id
),
events AS (
    SELECT 
      start_time AS event_time,
      1 AS change
    FROM completed_jobs

    UNION ALL

    SELECT 
      end_time AS event_time,
      -1 AS change
    FROM completed_jobs
),
timeline AS (
    SELECT
        event_time,
        SUM(change) OVER (
            ORDER BY event_time, change
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS active_jobs
    FROM events
)
SELECT 
  MAX(active_jobs) AS min_workers
FROM timeline;
