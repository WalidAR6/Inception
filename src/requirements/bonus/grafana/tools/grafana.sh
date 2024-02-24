#!/bin/bash

mkdir /var/lib/grafana/plugins

grafana-cli plugins install redis-datasource

grafana-server -homepath /usr/share/grafana\
	--config /etc/grafana/grafana.ini
