#!/bin/bash

set -x

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

wp cli update --allow-root

wp core download --allow-root

wp config create --dbname=wordpress --dbuser=obmium --dbpass=obmiumpass --dbhost=mariadb --allow-root

wp core install --url=localhost --title=wp --admin_user=obm --admin_password=obmpass --admin_email=obm@gmail.com --allow-root

wp user create walid walid@gmail.com --role=author --user_pass=walidpass --allow-root

sed -i -e "s|/run/php/php8.2-fpm.sock|0.0.0.0:9000|g" "/etc/php/8.2/fpm/pool.d/www.conf"

service php8.2-fpm start
service php8.2-fpm stop

php-fpm8.2 -F