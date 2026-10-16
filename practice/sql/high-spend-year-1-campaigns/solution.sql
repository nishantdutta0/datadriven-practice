WITH campaign_info AS (
SELECT
  ad_campaign,
  EXTRACT(YEAR FROM impression_time) AS impression_year,
  COUNT(DISTINCT user_id) AS unique_users,
  SUM(revenue) AS total_revenue
FROM ad_impressions
GROUP BY ad_campaign, EXTRACT(YEAR FROM impression_time)
ORDER BY ad_campaign
)
SELECT
  ad_campaign,
  impression_year,
  unique_users
FROM campaign_info
WHERE total_revenue > 5;
