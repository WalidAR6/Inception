FROM debian:bullseye

WORKDIR /var/www/inception

COPY /tools/ssl-req.sh /bin

RUN apt update \
    && apt install openssl nginx gettext-base -y \
    && chmod +x /bin/ssl-req.sh

COPY /conf/nginx.conf.template /etc/nginx

CMD [ "bash", "/bin/ssl-req.sh"]
