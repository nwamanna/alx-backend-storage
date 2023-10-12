
-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.

-- Requirements:

-- Procedure ComputeAverageScoreForUser is taking 1 input:
-- user_id, a users.id value (you can assume user_id is linked to an existing users)


DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_weight FLOAT;
    DECLARE weighted_sum INT;

    SELECT SUM(weight) INTO total_weight FROM projects;
    SELECT SUM(projects.weight * corrections.score) INTO weighted_sum FROM corrections
    JOIN projects ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    -- update the users average score with the weighted avergae score
    UPDATE users
    SET average_score = (
        weighted_sum / total_weight
    )
    WHERE id = user_id;
END $$

DELIMITER ;
