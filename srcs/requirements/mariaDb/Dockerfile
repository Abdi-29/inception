FROM debian:buster 

RUN apt-get update -y && apt-get install -y mariadb-server

# purge and re-create /var/lib/mysql with appropriate ownership

RUN rm -rf /var/lib/mysql; \
	mkdir -p /var/lib/mysql /var/run/mysqld; \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
    # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	chmod 777 /var/run/mysqld; \
    rm -rf /var/lib/apt/lists/*
COPY ./tools /tools
RUN echo "bind-address = 0.0.0.0" >> etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
CMD service mariadb start && mysql < /tools/users.sql
# CMD ["mariadbd"]