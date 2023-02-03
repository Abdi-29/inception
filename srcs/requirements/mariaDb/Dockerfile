FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
# ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
# ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN apt-get update -y && apt-get install -y mariadb-server net-tools telnet

COPY ./tools /tools

COPY /conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /tools/test.sh


ENTRYPOINT ["sh", "tools/test.sh", "mysqld"]
EXPOSE 3306