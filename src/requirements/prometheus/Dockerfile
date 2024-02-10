FROM debian:bullseye

RUN apt update &&\
    apt install iputils-ping wget -y &&\
    wget https://github.com/prometheus/prometheus/releases/download/v2.49.1/prometheus-2.49.1.linux-amd64.tar.gz &&\
    tar -xvf prometheus-2.49.1.linux-amd64.tar.gz && mv prometheus-2.49.1.linux-amd64 /etc/prometheus

WORKDIR /etc/prometheus

COPY conf/prometheus.yml prometheus.yml

CMD [ "./prometheus" ]