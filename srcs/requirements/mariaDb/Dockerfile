FROM debian:buster 

ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}

RUN apt-get update -y && apt-get install -y mariadb-server

COPY ./tools /tools
COPY ./tools/entrypoint.sh entrypoint.sh

RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' \
		 -i /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mariadb < /tools/users.sql
# RUN chmod +x entrypoint.sh
# RUN ./entrypoint.sh
EXPOSE 3306
CMD [ "mysqld" ]