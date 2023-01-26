FROM debian:buster

EXPOSE 9000

ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_HOST=${MYSQL_HOST}

# installing php fastcgi (it reccomanded when running it with nginx)
# php  -mysql will allow the wordpress to connect with mariadb
RUN apt-get update -y && apt-get -y install php7.3 php-fpm php-mysql mariadb-client wget curl
RUN mkdir /run/php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /tmp/
COPY tools/run.sh run.sh
RUN chmod +x run.sh
ENTRYPOINT ./run.sh && php-fpm7.3 -F
