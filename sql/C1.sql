CREATE FUNCTION attended_credit_total(p_volunteer_id integer)
RETURNS numeric
LANGUAGE sql
AS $$
    SELECT COALESCE(SUM(r.credits_perhour * EXTRACT(EPOCH FROM (s.ends_at - s.starts_at)) / 3600), 0)
    FROM signup su
    JOIN shift s ON s.shift_ref = su.shift_ref
    JOIN role r ON r.role_code = s.role_code
    WHERE su.volunteer_id = p_volunteer_id
      AND su.status = 'Attended';
$$;
