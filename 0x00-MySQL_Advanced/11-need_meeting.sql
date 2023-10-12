-- Create the view need_meeting
CREATE OR REPLACE VIEW need_meeting AS
SELECT name
FROM students
WHERE (score < 80 AND (last_meeting IS NULL OR last_meeting <= NOW() - INTERVAL 1 MONTH));

