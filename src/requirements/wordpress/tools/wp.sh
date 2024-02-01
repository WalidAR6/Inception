#!/bin/bash

sleep 10

set -x

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

if ! wp core is-installed --allow-root; then
    wp core download --allow-root
    wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --allow-root
    wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
fi

python3 -m venv env
source env/bin/activate > /dev/null 2>&1

if ! pip3 list | grep mysql-connector-python; then
    pip3 install mysql-connector-python > /dev/null 2>&1
fi

user=$(python3 /bin/user_check.py $WP_AUTHOR) && if [ "$user" = "does not exist" ]; then
    wp user create $WP_AUTHOR $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PASSWORD --allow-root
fi > /dev/null 2>&1

deactivate > /dev/null 2>&1

sed -i -e "s|/run/php/php8.2-fpm.sock|0.0.0.0:9000|g" "/etc/php/8.2/fpm/pool.d/www.conf"

service php8.2-fpm start
service php8.2-fpm stop

php-fpm8.2 -F