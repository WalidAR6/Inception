#!/bin/bash

sed -i -e "s/127.0.0.1/0.0.0.0/g" "/etc/mysql/mariadb.conf.d/50-server.cnf"

service mariadb start

mysql_secure_installation << EOF > /dev/null 2>&1

n
y
$MARIADB_ROOT_PASSWORD
$MARIADB_ROOT_PASSWORD
y
n
n
y
EOF

mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" -p$MARIADB_ROOT_PASSWORD

mariadb -uroot -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" -p$MARIADB_ROOT_PASSWORD

mariadb -uroot -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;" -p$MARIADB_ROOT_PASSWORD

mariadb -uroot -e "FLUSH PRIVILEGES;" -p$MARIADB_ROOT_PASSWORD

service mariadb stop

mariadbd
