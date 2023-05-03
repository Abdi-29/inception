CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS "${MYSQL_USER}"@"%" IDENTIFIED BY "${MYSQL_PASSWORD}";
ALTER USER "${MYSQL_USER}"@"%" IDENTIFIED BY "${MYSQL_PASSWORD}";
GRANT ALL PRIVILEGES ON * . * TO "${MYSQL_USER}"@"%" IDENTIFIED by "${MYSQL_PASSWORD}";
ALTER USER 'root'@'localhost' IDENTIFIED BY "${MYSQL_ROOT_PASSWORD}";
GRANT ALL PRIVILEGES on * . * TO 'root'@'localhost' IDENTIFIED BY "${MYSQL_ROOT_PASSWORD}";
FLUSH PRIVILEGES;