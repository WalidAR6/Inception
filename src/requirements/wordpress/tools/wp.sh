#!/bin/bash

set -x

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

if ! wp core is-installed --allow-root; then
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=obmium --dbpass=obmiumpass --dbhost=mariadb --allow-root
    wp core install --url=localhost --title=wp --admin_user=obm --admin_password=obmpass --admin_email=obm@gmail.com --allow-root
fi

python3 -m venv env
source env/bin/activate > /dev/null 2>&1

if ! pip3 list | grep mysql-connector-python; then
    pip3 install mysql-connector-python > /dev/null 2>&1
fi

user=$(python3 /bin/user_check.py walid) && if [ "$user" = "does not exist" ]; then
    wp user create walid walid@gmail.com --role=author --user_pass=walidpass --allow-root
fi > /dev/null 2>&1

deactivate > /dev/null 2>&1

sed -i -e "s|/run/php/php8.2-fpm.sock|0.0.0.0:9000|g" "/etc/php/8.2/fpm/pool.d/www.conf"

service php8.2-fpm start
service php8.2-fpm stop

php-fpm8.2 -F