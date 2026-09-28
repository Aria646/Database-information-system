SELECT pr.PostId, COUNT(DISTINCT pr.Username) AS NumUsersReacted
FROM PostReaction pr
GROUP BY pr.PostId
HAVING SUM(pr.ReactionType = 'Heart') >= 3;