WITH campaign_info AS (
  SELECT
    ad_campaign,
    MIN(
      CAST(impression_time AS DATE)
      ) AS first_date,
    MAX(
      CAST(impression_time AS DATE)
      ) AS last_date,
    COUNT(*) AS total_impression
  FROM ad_impressions
  GROUP BY 1
  ORDER BY 1
)

SELECT
  a.ad_campaign,
  ROUND(
    CAST(
      (
        SUM(
          CASE
            WHEN CAST(
              a.impression_time
              AS DATE
              ) = c.first_date THEN 1
            ELSE 0
          END
          ) * 100
      )
      AS DECIMAL(10, 3)
      ) / c.total_impression,
    3
    ) AS first_day_pct,
  ROUND(
    CAST(
      (
        SUM(
          CASE
            WHEN CAST(
              a.impression_time
              AS DATE
              ) = c.last_date THEN 1
            ELSE 0
          END
          ) * 100
      )
      AS DECIMAL(10, 3)
      ) / c.total_impression,
    3
    ) AS last_day_pct
FROM ad_impressions AS a
INNER JOIN campaign_info AS c
  ON a.ad_campaign = c.ad_campaign
GROUP BY 1
ORDER BY 1;
