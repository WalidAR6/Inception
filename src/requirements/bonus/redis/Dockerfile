FROM debian:bullseye

RUN apt update &&\
    apt install redis-server -y &&\
    service redis-server start

CMD [ "redis-server", "--protected-mode no"]
