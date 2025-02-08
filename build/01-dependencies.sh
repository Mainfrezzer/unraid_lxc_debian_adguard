#!/bin/bash
apt-get update
apt-get -y install wget curl nano unbound keepalived iputils-ping cron jq
systemctl stop unbound keepalived
systemctl disable keepalived
sed -i "s/#DNSStubListener=yes/DNSStubListener=no/g" /etc/systemd/resolved.conf && \
systemctl restart systemd-resolved
