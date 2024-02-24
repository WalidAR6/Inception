FROM debian:bullseye

WORKDIR /var/www/rps

COPY tools/ .

RUN apt update && \
    apt install python3 python3-pip gunicorn -y &&\
    pip3 install Flask

CMD [ "gunicorn", "-w 1", "-b 0.0.0.0:5000", "app:app" ]

