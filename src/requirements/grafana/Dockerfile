FROM debian:bullseye

WORKDIR /etc/grafana

RUN apt update && apt install -y gnupg2 wget software-properties-common &&\
    wget -q -O - https://packages.grafana.com/gpg.key | apt-key add - &&\
    apt update &&\
    add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" &&\
    apt update && apt install -y grafana &&\
    sed -i -e "s/;enabled = false/enabled = true/572" /etc/grafana/grafana.ini

CMD [ "grafana-server", "-homepath /usr/share/grafana", "--config /etc/grafana/grafana.ini", "cfg:default.paths.provisioning='/etc/grafana/provisioning'"]