SELECT u.Username
FROM User u
WHERE Username NOT IN (
  SELECT UserBeingFollowed
  FROM UserFollows uf
  WHERE UserBeingFollowed IS NOT NULL  
)
ORDER BY Username;