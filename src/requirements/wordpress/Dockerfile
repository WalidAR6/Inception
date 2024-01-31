FROM debian:12.0

WORKDIR /var/www/inception

COPY tools/wp.sh /bin
COPY tools/user_check.py /bin

RUN apt-get update &&\
    apt install curl php php-mysql php-fpm -y &&\
    apt install python3 python3-pip python3-venv -y &&\
    chmod +x /bin/wp.sh

CMD [ "bash", "/bin/wp.sh" ]
