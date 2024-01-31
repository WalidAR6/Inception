import mysql.connector
import sys

cnx=mysql.connector.connect(user='obmium',
                            password='obmiumpass',
                            host='mariadb',
                            database='wordpress')

cursor=cnx.cursor()

cursor.execute('SELECT user_login FROM wp_users')

user=sys.argv[1]

is_exist=0

for users in cursor:
    if user in users:
        is_exist=1

if (is_exist==1):
    print('exist')
else:
    print('does not exist')

cursor.close()
cnx.close()