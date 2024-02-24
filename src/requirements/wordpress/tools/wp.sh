#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

if ! wp core is-installed --allow-root; then
    wp core download --allow-root
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
fi

wp user create $WP_AUTHOR $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PASSWORD --allow-root

sed -i -e "s|/run/php/php7.4-fpm.sock|0.0.0.0:9000|g" "/etc/php/7.4/fpm/pool.d/www.conf"

wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set FS_METHOD direct --allow-root
wp plugin install redis-cache --activate --allow-root
chmod 777 -R .

wp redis enable --allow-root

service php7.4-fpm start
service php7.4-fpm stop

php-fpm7.4 -F
