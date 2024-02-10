FROM debian:bullseye

WORKDIR /var/www/inception

COPY /tools/ssl-req.sh /bin

RUN apt update \
    && apt install openssl -y && apt install nginx -y \
    && chmod +x /bin/ssl-req.sh

COPY /conf/ng.conf /etc/nginx/sites-available/default

CMD [ "bash", "/bin/ssl-req.sh"]