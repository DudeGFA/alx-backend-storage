-- SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUser that computes and
-- store the average weighted score for a student
DELIMITER $$ ;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    SET weight  = (
        SELECT weight FROM projects WHERE id = user_id)
    UPDATE users
    SET average_score = (SELECT AVG(score * weight)
        FROM corrections WHERE corrections.user_id = user_id)
    WHERE id = user_id;
END;$$
DELIMITER ;