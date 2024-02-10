FROM debian:bullseye

RUN apt update &&\
    apt install redis redis-server -y &&\
	sed -i "s|bind 127.0.0.1 -::1|bind 0.0.0.0|" /etc/redis/redis.conf &&\
    service redis-server start

CMD [ "redis-server", "--protected-mode no"]
