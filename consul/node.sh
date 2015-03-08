#!/usr/bin/env bash
set -e

echo "======CONSUL NODE======"

ip=$1

mkdir -p /etc/consul.d/agent
cp /tmp/consul-node.json /etc/consul.d/agent/config.json
sed -i'' -e "s/\:ip\:/$ip/" /etc/consul.d/agent/config.json

foreman export upstart /etc/init --procfile /tmp/consul-node.procfile --user vagrant --app consul
service consul restart
