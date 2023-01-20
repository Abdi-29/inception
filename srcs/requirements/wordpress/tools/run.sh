echo starting..........................2222................

cd /var/www/wordpress 
wp config create --allow-root --path= --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbhost="wordpress" --dbpass=${MYSQL_PASSWORD} --config-file=/var/www/wordpress/wp-config.php
wp core install --allow-root --path= --url=wpclidemo.dev --title="inception" --admin_user=${WP_DB_ADMIN} --admin_password=${WP_DB_ADMIN_PASSWORD} --admin_email=${WP_DB_USER_EMAIL}
