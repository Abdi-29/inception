echo starting..........................333333333333................
mkdir -p /var/www/html/wordpress
touch /run/php/php7.3-fpm.pid;
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv /etc/wp-config.php /var/www/html/wordpress/
	mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html/wordpress
    wp --allow-root core download
    echo "trying to connect with the database"
    until mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} ping; do
           sleep 2
    done
	echo "creating admin user"
    #wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbhost=mariadb --dbpass=${MYSQL_PASSWORD} --config-file=/var/www/html/wordpress/wp-config.php
    wp core install --url="${DOMAIN_NAME}" --title="inception" --admin_user="${WP_DB_ADMIN}" --admin_password="${WP_DB_ADMIN_PASSWORD}" --admin_email="${WP_DB_EMAIL}" --allow-root
    echo "creating wordpress user......" 
	wp user create ${WP_DB_USER} ${WP_DB_USER_EMAIL} --user_pass=${WP_DB_PASSWORD} --allow-root
fi
echo "doneeeeeeeeeeeeeeeeeee..................."
exec /usr/sbin/php-fpm7.3 -F
