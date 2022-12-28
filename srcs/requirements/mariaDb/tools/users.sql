CREATE DATABASE IF NOT EXISTS db;


CREATE USER IF NOT EXISTS 'ab'@'localhost' IDENTIFIED BY 'test';
ALTER USER 'ab'@'localhost' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON * . * TO 'ab'@'localhost' IDENTIFIED by 'test';