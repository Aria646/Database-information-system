INSERT INTO Post (Id, Caption, CreationDateTime, Username)
VALUES (200, 'New pics from Japan!', '2025-07-10 14:53:00', 'Allan')
ON DUPLICATE KEY UPDATE
  Caption = VALUES(Caption),
  CreationDateTime = VALUES(CreationDateTime),
  Username = VALUES(Username);

INSERT IGNORE INTO PostImage (PostId, ImageURL) VALUES
(200, 'https://antisocial.media/f1e2d3c4-b5a6-4978-9182-3d4e5f6a7b8c.png'),
(200, 'https://antisocial.media/2c3d4e5f-6a7b-48c9-d1e2-f3a4b5c6d7e8.jpg');

INSERT INTO PostReaction (Username, PostId, ReactionType)
SELECT u.Username, 200, 'Like'
FROM User u
WHERE u.Username <> 'Allan'
  AND NOT EXISTS (
        SELECT 1 FROM PostReaction pr
        WHERE pr.Username = u.Username
          AND pr.PostId   = 200
          AND pr.ReactionType = 'Like'
      );
