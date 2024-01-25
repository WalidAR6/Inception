#!/bin/bash

export DATABASE="dockerIsFun"
export USERNAME="obmium"
export USERPASS="obmiumpass"
export ADMINNAME="admin"
export ADMINPASS="adminpass"
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

mariadb -e "create database $DATABASE;"

mariadb -e "create user '$USERNAME'@'%' identified by '$USERPASS';"

mariadb -e "grant all privileges on $DATABASE.* to '$USERNAME'@'%' with grant option;"

mariadb -e "create user '$ADMINNAME'@'%' identified by '$ADMINPASS';"

mariadb -e "grant all privileges on *.* to '$ADMINNAME'@'%' with grant option;"

mariadb -e "flush privileges;"

service mariadb stop

mysqld
