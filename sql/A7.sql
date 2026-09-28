SELECT u.Username
FROM User u
WHERE NOT EXISTS (                    
  SELECT 1
  FROM Comment AS cbi                  
  WHERE cbi.Username = 'Ian'
    AND NOT EXISTS (                  
      SELECT 1
      FROM Comment cbu
      WHERE cbu.Username = u.Username
        AND cbu.PostId = cbi.PostId
    )
)
ORDER BY u.Username;