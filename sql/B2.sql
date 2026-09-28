CREATE VIEW shift_summary AS
SELECT s.shift_ref,
       r.role_name,
       s.starts_at,
       s.ends_at,
       COUNT(su.signup_ref) AS signup_count
FROM shift s
JOIN role r ON r.role_code = s.role_code
LEFT JOIN signup su ON su.shift_ref = s.shift_ref
GROUP BY s.shift_ref, r.role_name, s.starts_at, s.ends_at;
