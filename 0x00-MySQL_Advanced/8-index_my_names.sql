--  SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
DELIMITER $$ ;
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    CREATE INDEX idx_name_first ON names (name(1));
END;$$
DELIMITER ;