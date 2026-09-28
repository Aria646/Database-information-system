CREATE VIEW volunteer_attendance AS
SELECT v.volunteer_id,
       v.first_name,
       v.last_name,
       su.shift_ref,
       su.status
FROM volunteer v
JOIN signup su ON su.volunteer_id = v.volunteer_id;
