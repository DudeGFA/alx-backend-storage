--- Createsa new table users with these attributes:
---     id, integer, never null, auto increment and primary key
---     email, string (255 characters), never null and unique
 ---    name, string (255 characters)
CREATE TABLE IF NOT EXISTS users (id INT NOT NULL AUTO INCREMENT PRIMARY KEY, email CHAR(255) NOT NULL UNIQUE, name CHAR(255));
