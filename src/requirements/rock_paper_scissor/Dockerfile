FROM debian:bullseye

WORKDIR /var/www/rps

RUN apt update && \
    apt install nginx -y

COPY /conf/nginx.conf /etc/nginx/sites-available/default

CMD [ "nginx", "-g", "daemon off;" ]
