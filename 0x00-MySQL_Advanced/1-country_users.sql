-- Creates a new table users with these attributes:
--     id, integer, never null, auto increment and primary key
--     email, string (255 characters), never null and unique
--     name, string (255 characters)
--  country: never null, default = US
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country CHAR(2) NOT NULL DEFAULT 'US'
);