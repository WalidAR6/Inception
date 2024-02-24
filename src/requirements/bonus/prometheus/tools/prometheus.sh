#!/bin/bash

envsubst < /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml && rm /etc/prometheus/prometheus.yml.template 

cd /etc/prometheus

./prometheus
