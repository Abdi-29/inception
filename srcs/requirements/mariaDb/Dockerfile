FROM debian:buster 

RUN apt-get update -y && apt-get install -y mariadb-server

RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld &&\
    # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	chmod 777 /var/run/mysqld
COPY ./tools /tools
RUN service mysql start && mariadb -u root < /tools/users.sql

RUN 	sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' \
		 -i /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
#CMD service mysql start
CMD ["mysqld"]