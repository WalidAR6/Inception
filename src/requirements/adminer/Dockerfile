FROM debian:bullseye

WORKDIR /var/www/html

COPY tools/adminer.sh /bin
RUN apt update &&\
    apt install php php-mysql wget -y &&\
    wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php &&\
    chmod +x /bin/adminer.sh

CMD [ "bash", "/bin/adminer.sh"]