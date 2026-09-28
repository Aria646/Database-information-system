SELECT s.shift_ref, r.role_name, s.starts_at, s.ends_at
FROM shift s
JOIN role r ON r.role_code = s.role_code
ORDER BY s.starts_at;
