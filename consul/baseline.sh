#!/usr/bin/env bash
set -e

if [ ! -e /usr/local/bin/consul ]
then
  apt-get install unzip -y
  cd /tmp
  wget --quiet https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip
  unzip 0.4.1_linux_amd64.zip
  mv /tmp/consul /usr/local/bin/consul
fi
mkdir -p /etc/consul.d

if [ ! -e /usr/local/bin/consul-template ]
then
  apt-get install -y golang git
  export GOPATH=/tmp/go
  git clone https://github.com/hashicorp/consul-template.git /tmp/consul-template
  cd /tmp/consul-template
  make
  mv /tmp/consul-template/bin/consul-template /usr/local/bin/consul-template
fi
