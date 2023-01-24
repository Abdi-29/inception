echo starting..........................2222................
cd /var/www/html
wget wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
rm -f latest.tar.gz
rm index.html

chmod +x /usr/local/bin/wp
mkdir -p /var/www/html/wordpress
touch /run/php/php7.3-fpm.pid;
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
# mv /tmp/wp-config.php /var/www/wordpress/
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    mv /tmp/wp-config.php /var/www/html/wordpress
    cd /var/www/html/wordpress
    echo ----------------------${MYSQL_DATABASE}----------------
    chown -R www-data:www-data /etc/php/7.3/fpm/pool.d/www.conf
    echo "<?php phpinfo(); ?>" > /var/www/html/info.php
    wp --allow-root core download
    wp core install --allow-root --url="localhost" --title="inception" --admin_user=${WP_DB_ADMIN} --admin_password=${WP_DB_ADMIN_PASSWORD} --admin_email=${WP_DB_USER_EMAIL}
    wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbhost="wordpress" --dbpass=${MYSQL_PASSWORD} --config-file=/var/www/html/wordpress/wp-config.php
fi 
