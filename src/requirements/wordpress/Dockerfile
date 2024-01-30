FROM debian:12.0

WORKDIR /var/www/inception

COPY tools/wp.sh /bin

RUN apt-get update &&\
    apt install curl php php-mysql php-fpm -y &&\
    chmod +x /bin/wp.sh

CMD [ "bash", "/bin/wp.sh" ]
