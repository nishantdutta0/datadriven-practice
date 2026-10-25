SELECT
  u.user_id,
  u.username,
  u.email,
  a.token_id,
  a.scope
FROM users u
JOIN api_tokens a
  ON u.user_id = a.owner_id
WHERE LOWER(scope) LIKE '%admin%'
ORDER BY a.issued;
