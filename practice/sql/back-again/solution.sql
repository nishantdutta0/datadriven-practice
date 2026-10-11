WITH transaction_info AS (
  SELECT
    u.username,
    COUNT(t.total_amount) AS txn_count,
    DENSE_RANK() OVER (
      ORDER BY COUNT(t.total_amount) DESC
    ) AS tier
  FROM users AS u
  JOIN transactions AS t
    ON u.user_id = t.user_id
  WHERE t.total_amount > 0
  GROUP BY u.username
)
  
SELECT
  username,
  txn_count,
  tier
FROM transaction_info
WHERE tier <= 2
ORDER BY tier, username;
