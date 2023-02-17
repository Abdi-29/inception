FROM debian:buster

EXPOSE 9000

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_HOST

ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_HOST=$MYSQL_HOST

# installing php fastcgi (it reccomanded when running it with nginx)
# php  -mysql will allow the wordpress to connect with mariadb
RUN apt-get update -y && apt-get -y install php7.3 php-fpm php-mysql mariadb-client wget curl sendmail
RUN mkdir /run/php
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d
COPY /conf/wp-config.php /etc/wp-config.php
COPY tools/run.sh /etc/run.sh
RUN chmod +x /etc/run.sh
ENTRYPOINT ["/bin/bash", "/etc/run.sh"]
