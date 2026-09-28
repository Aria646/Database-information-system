WITH Popular AS (
  SELECT pr.PostId
  FROM PostReaction pr
  WHERE pr.ReactionType = 'Heart'
  GROUP BY pr.PostId
  HAVING COUNT(DISTINCT pr.Username) >= 3
),
Famous AS (
  SELECT uf.UserBeingFollowed AS Username
  FROM UserFollows uf
  GROUP BY uf.UserBeingFollowed
  HAVING COUNT(*) >= 2
),
HeartCount AS (
  SELECT PostId, COUNT(DISTINCT Username) AS Hearts
  FROM PostReaction
  WHERE ReactionType = 'Heart'
  GROUP BY PostId
)
SELECT p.Username, p.Id AS PostId, hc.Hearts
FROM Post p
JOIN Popular pop ON pop.PostId = p.Id
JOIN Famous f ON f.Username = p.Username
JOIN HeartCount hc ON hc.PostId = p.Id
ORDER BY p.Username, p.Id;
