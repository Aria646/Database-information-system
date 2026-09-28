SELECT f.UserFollowing AS Username
FROM UserFollows f
WHERE f.UserBeingFollowed = 'Allan'
  AND NOT EXISTS (
    SELECT 1
    FROM PostReaction pr
    WHERE pr.PostId = (
            SELECT p.Id
            FROM Post p
            WHERE p.Username = 'Allan'
            ORDER BY p.CreationDateTime DESC, p.Id DESC
            LIMIT 1
          )
      AND pr.Username = f.UserFollowing
  )
ORDER BY f.UserFollowing;