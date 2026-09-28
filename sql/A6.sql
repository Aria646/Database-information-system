SELECT volunteer_id, first_name, last_name, credits
FROM volunteer
WHERE credits > 0
ORDER BY credits DESC;
