service mysql start && mariadb -u root < /tools/users.sql

sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i /etc/mysql/mariadb.conf.d/50-server.cnf