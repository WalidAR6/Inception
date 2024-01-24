FROM debian:bullseye

WORKDIR /var/www/inception

COPY /src/ssl-req.sh .

RUN apt update && apt install openssl && apt install nginx -y \
    && chmod +x ssl-req.sh

COPY index.html .

COPY conf.conf /etc/nginx/sites-available/default

CMD [ "./ssl-req.sh"]