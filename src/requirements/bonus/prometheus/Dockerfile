FROM debian:bullseye

COPY tools/prometheus.sh /bin

RUN apt update &&\
    apt install iputils-ping wget gettext-base -y &&\
    wget https://github.com/prometheus/prometheus/releases/download/v2.49.1/prometheus-2.49.1.linux-amd64.tar.gz &&\
    tar -xvf prometheus-2.49.1.linux-amd64.tar.gz && mv prometheus-2.49.1.linux-amd64 /etc/prometheus &&\
    chmod +x /bin/prometheus.sh

WORKDIR /etc/prometheus

COPY conf/prometheus.yml.template .

CMD [ "bash", "/bin/prometheus.sh" ]
