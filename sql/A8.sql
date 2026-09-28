SELECT v.volunteer_id,
       v.first_name,
       v.last_name,
       COUNT(su.signup_ref) AS signup_count
FROM volunteer v
LEFT JOIN signup su ON su.volunteer_id = v.volunteer_id
GROUP BY v.volunteer_id, v.first_name, v.last_name
ORDER BY signup_count DESC, v.volunteer_id;
