SELECT p.Id,
       COUNT(c.Id) AS NumComments
FROM Post p
LEFT JOIN Comment c
       ON c.PostId = p.Id
GROUP BY p.Id;