#!/bin/bash

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfs.key -out /etc/ssl/certs/nginx-selfs.crt << EOF > /dev/null 2>&1
CA
QC
Company Inc
ww
ww
example.com
ljnrvlss

EOF

nginx -g "daemon off;"
