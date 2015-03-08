#!/usr/bin/env bash
set -e

echo "Provisioning consul_server"

ip=$1

mkdir -p /etc/consul.d/server

cp /tmp/consul-server.json /etc/consul.d/server/config.json
sed -i'' -e "s/\:ip\:/$ip/" /etc/consul.d/server/config.json

cd /tmp
mkdir -p /var/lib/consul
wget --quiet https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip
unzip 0.4.1_web_ui.zip
mv dist /var/lib/consul/web_ui
chown -R vagrant:vagrant /var/lib/consul

foreman export upstart /etc/init --procfile /tmp/consul-server.procfile --user vagrant --app consul
service consul restart
