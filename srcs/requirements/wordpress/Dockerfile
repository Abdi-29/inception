FROM debian:buster

EXPOSE 9000

ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_HOST=${MYSQL_HOST}
# installing php fastcgi (it reccomanded when running it with nginx)
# php  -mysql will allow the wordpress to connect with mariadb
RUN apt-get update -y && apt-get -y install php php-fpm php-mysql mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d

RUN wp --allow-root --path=/var/www/wordpress core download
COPY tools/run.sh /run.sh
RUN chmod 777 run.sh
ENTRYPOINT ./run.sh && "php-fpm -F"