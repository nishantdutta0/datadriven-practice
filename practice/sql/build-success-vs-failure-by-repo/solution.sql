SELECT
  repo_name,
  COALESCE(
    SUM(
      CASE
        WHEN status = 'success' THEN 1
      END
    ),
    0
  ) AS success_count,
  COALESCE(
    SUM(
      CASE
        WHEN status = 'failure' THEN 1
      END
    ),
    0
  ) AS failure_count,
  AVG(dur_secs) AS avg_duration
FROM ci_builds
GROUP BY repo_name
