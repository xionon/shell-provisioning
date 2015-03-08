#!/usr/bin/env bash
set -e

echo "======INSTALLING POSTGRESQL"
if [ ! `which psql` ]
then
  apt-get install -y postgresql postgresql-contrib postgresql-server-dev-all
  sudo -u postgres createuser -s vagrant
  # sudo -u postgres createdb -O vagrant book
else
  echo "...skipping"
fi
