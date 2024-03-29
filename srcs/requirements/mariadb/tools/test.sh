#!/bin/bash
service mysql start
echo "
	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
	CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	ALTER USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
	GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
	SET PASSWORD FOR 'root'@'%' = PASSWORD('lol');
	FLUSH PRIVILEGES;" > /tools/users.sql
mysql < /tools/users.sql

exec $@