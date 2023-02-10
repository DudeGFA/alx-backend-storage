-- SQL script that creates a trigger that resets the attribute valid_email 
-- only when the email has been changed
CREATE TRIGGER TRIG
BEFORE UPDATE 
ON users FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email 
        SET NEW.valid_email = 0;
    END IF;
END;