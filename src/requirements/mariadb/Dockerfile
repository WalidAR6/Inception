FROM debian:bullseye

WORKDIR /bin

COPY /tools/maria.sh .

RUN apt-get update \
    && apt-get install mariadb-server -y \
    && chmod +x maria.sh

CMD [ "./maria.sh" ]
