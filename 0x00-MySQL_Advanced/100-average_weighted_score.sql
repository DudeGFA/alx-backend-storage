-- SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUser that computes and
-- store the average weighted score for a student
DELIMITER $$ ;
CREATE PROCEDURE ComputeAverageScoreForUser(user_id INT)
BEGIN
    DECLARE weighted_score_sum INT DEFAULT 0;
    DECLARE weight_sum INT DEFAULT 0;

    SELECT SUM(corrections.score * projects.weight)
        INTO weighted_score_sum
        FROM corrections
        INNER JOIN projects
        ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    SELECT SUM(projects.weight)
    INTO weight_sum
    FROM corrections
    INNER JOIN projects
    ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    IF weight_sum = 0 THEN
        UPDATE users
        SET users.average_score = 0
        WHERE users.id = user_id;
    ELSE
        UPDATE users
        SET users.average_score = weighted_score_sum / weight_sum
        WHERE users.id = user_id;
    END IF;
END $$
DELIMITER ;