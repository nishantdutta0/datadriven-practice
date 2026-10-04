SELECT
  ai.impression_id,
  ai.user_id,
  ai.ad_campaign,
  ai.impression_time,
  ai.clicked,
  ai.revenue,
  u.username,
  u.email,
  u.signup_date,
  u.account_status,
  u.age_bucket
FROM ad_impressions AS ai
LEFT JOIN users AS u
  ON ai.user_id = u.user_id
WHERE LOWER(ad_campaign) = '%holiday%'
ORDER BY impression_id ASC
