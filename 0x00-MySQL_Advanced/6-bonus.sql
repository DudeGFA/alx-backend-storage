--  SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)

BEGIN
    IF NOT EXISTS(SELECT name FROM projects WHERE name=project_name) THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;
    INSERT INTO corrections (user_id, project_id, store)
    VALUES (user_id, (SELECT id from projects WHERE name=project_name), score)
