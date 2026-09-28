DELETE t
FROM PostReaction t
JOIN PostReaction d
ON d.PostId   = t.PostId
AND d.Username = 'Daniel'
WHERE t.Username = 'TotallyNotABot';

UPDATE PostReaction
SET Username = 'Daniel'
WHERE Username = 'TotallyNotABot';

UPDATE Comment
SET Username = 'Daniel'
WHERE Username = 'TotallyNotABot';

UPDATE Post
SET Username = 'Daniel'
WHERE Username = 'TotallyNotABot';

DELETE FROM UserFollows
WHERE UserBeingFollowed = 'TotallyNotABot'
   OR UserFollowing      = 'TotallyNotABot';

DELETE FROM User
WHERE Username = 'TotallyNotABot';
