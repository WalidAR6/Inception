#!/bin/bash

set x

envsubst < /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml && rm /etc/prometheus/prometheus.yml.template 
cd /etc/prometheus

./prometheus
