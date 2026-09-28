SELECT r.role_code,
       r.role_name,
       COUNT(s.shift_ref) AS shift_count
FROM role r
LEFT JOIN shift s ON s.role_code = r.role_code
GROUP BY r.role_code, r.role_name
HAVING COUNT(s.shift_ref) > 0
ORDER BY shift_count DESC, r.role_code;
