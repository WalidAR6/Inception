#!/bin/bash

export DATABASE="wordpress"
export USERNAME="obmium"
export USERPASS="obmiumpass"
export ROOTPASS="rootpass"

set -x

sed -i -e "s/127.0.0.1/0.0.0.0/g" "/etc/mysql/mariadb.conf.d/50-server.cnf"

service mariadb start

mysql_secure_installation << EOF > /dev/null 2>&1

n
y
$ROOTPASS
$ROOTPASS
y
n
n
y
EOF

mariadb -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"

mariadb -e "CREATE USER IF NOT EXISTS '$USERNAME'@'%' IDENTIFIED BY '$USERPASS';"

mariadb -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$USERNAME'@'%' WITH GRANT OPTION;"

mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld --user=root
