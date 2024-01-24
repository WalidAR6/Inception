FROM debian:bullseye

WORKDIR /var/www/inception

COPY /tools/ssl-req.sh .

RUN apt update && apt install openssl && apt install nginx -y \
    && chmod +x ssl-req.sh

COPY /tools/index.html .

COPY /conf/ng.conf /etc/nginx/sites-available/default

CMD [ "./ssl-req.sh"]