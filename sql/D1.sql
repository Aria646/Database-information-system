UPDATE volunteer v
SET credits = attended_credit_total(v.volunteer_id);
