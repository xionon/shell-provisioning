#!/usr/bin/env bash

set -e

echo "======BASELINE======"
if [ ! `which git` ]
then
  apt-get update -y
  apt-get upgrade -y
  apt-get install curl vim git ruby -y
  gem install foreman --no-ri --no-rdoc
else
  echo "...skipping"
fi
