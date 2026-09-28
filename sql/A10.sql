SELECT v.volunteer_id,
       v.first_name,
       v.last_name,
       SUM(r.credits_perhour * EXTRACT(EPOCH FROM (s.ends_at - s.starts_at)) / 3600) AS earned_credits
FROM volunteer v
JOIN signup su ON su.volunteer_id = v.volunteer_id
JOIN shift s ON s.shift_ref = su.shift_ref
JOIN role r ON r.role_code = s.role_code
WHERE su.status = 'Attended'
GROUP BY v.volunteer_id, v.first_name, v.last_name
ORDER BY earned_credits DESC, v.volunteer_id;
