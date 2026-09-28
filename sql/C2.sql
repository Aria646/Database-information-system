SELECT volunteer_id,
       attended_credit_total(volunteer_id) AS calculated_credits
FROM volunteer
ORDER BY volunteer_id;
