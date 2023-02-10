-- SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUser that computes and
-- store the average weighted score for a student
DELIMITER $$ ;
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    SET _weight  = (
        SELECT weight FROM projects WHERE id = user_id)
    SET _score = (SELECT score
        FROM corrections WHERE corrections.user_id = user_id)
    UPDATE users
    SET average_score = SUM( _score * _weight) / SUM(_weight)
    WHERE id = user_id;
END;$$
DELIMITER ;