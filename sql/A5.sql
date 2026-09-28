SELECT Username
FROM Post
GROUP BY Username
HAVING COUNT(*) >= ALL (
  SELECT COUNT(*)
  FROM Post
  GROUP BY Username
)
ORDER BY Username;
