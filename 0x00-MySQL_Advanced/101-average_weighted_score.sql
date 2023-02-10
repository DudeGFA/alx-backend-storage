-- SQL script that creates a stored procedure
-- ComputeAverageWeightedScoreForUsers that computes and
-- store the average weighted score for all students
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users as U,
    (SELECT users.id, (SUM(score * weight) / SUM(weight)) AS weighted_avg
        FROM users
        JOIN corrections ON users.id = corrections.user_id
        JOIN projects ON corrections.project_id = projects.id
        GROUP BY users.id) AS weighted_table
        SET U.average_score = weighted_table.weighted_avg
        WHERE U.id = weighted_table.id
END $$
DELIMITER ;