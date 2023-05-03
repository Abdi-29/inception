FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN apt-get update -y && apt-get install -y mariadb-server gettext-base

COPY ./tools /tools

RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' \
	-i /etc/mysql/mariadb.conf.d/50-server.cnf

RUN cat /tools/users.sql | envsubst > /tools/test.sql

RUN service mysql start && mysql < /tools/test.sql

EXPOSE 3306

CMD ["mysqld"]
