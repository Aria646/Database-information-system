SELECT COUNT(DISTINCT pi.PostId) AS NumPostsOnASMServer
FROM PostImage pi
WHERE pi.ImageURL LIKE 'https://antisocial.media%';