#!/bin/bash

set -x

openssl req -x509 -nodes -newkey rsa:2048 -keyout $CERT_KEY -out $CERT << EOF > /dev/null 2>&1
CA
QC
Company Inc
ww
ww
example.com
ljnrvlss

EOF

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/sites-available/default && nginx -g "daemon off;"
