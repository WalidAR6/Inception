FROM debian:bullseye

WORKDIR /var/www/rps

COPY tools/ .

RUN apt update && \
    apt install nodejs -y

CMD [ "bash" ]