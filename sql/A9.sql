CREATE OR REPLACE VIEW AllanFollowReact AS
SELECT DISTINCT UserFollowing AS u
FROM UserFollows
WHERE UserBeingFollowed = 'Allan'
UNION ALL
SELECT DISTINCT pr.Username AS u
FROM PostReaction pr
JOIN Post p ON p.Id = pr.PostId
WHERE p.Username = 'Allan';

SELECT COUNT(*) AS NumStalkers
FROM (
  SELECT u
  FROM AllanFollowReact
  GROUP BY u
  HAVING COUNT(*) = 2
) fr
WHERE NOT EXISTS (
  SELECT 1
  FROM Comment c
  JOIN Post p2 ON p2.Id = c.PostId
  WHERE p2.Username = 'Allan'
    AND c.Username = fr.u
);
