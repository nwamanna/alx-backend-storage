
-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers that computes and store the average weighted score for all students.

-- Requirements:

-- Procedure ComputeAverageWeightedScoreForUsers is not taking any input.


DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE total_weight FLOAT;
    DECLARE weighted_sum INT;

    SELECT SUM(weight) INTO total_weight FROM projects;
    SELECT SUM(projects.weight * corrections.score) INTO weighted_sum FROM corrections
    JOIN projects ON corrections.project_id = projects.id;

    -- update the users average score with the weighted avergae score
    UPDATE users
    SET average_score = (
        weighted_sum / total_weight
    );

END $$

DELIMITER ;
