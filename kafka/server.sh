#! /usr/bin/env sh
set -e

echo "====KAFKA===="

ip=$1
apt-get install default-jre

cd /tmp
wget --quiet http://apache.tradebit.com/pub/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz
tar -xzf kafka_2.10-0.8.2.0.tgz
