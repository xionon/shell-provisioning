 #!/usr/bin/env bash

set -e

if [ ! -e "/home/vagrant/.rvm/scripts/rvm" ]
then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3

  if [ ! -e /home/vagrant/.gemrc ]
  then echo "gem: --no-document" >> /home/vagrant/.gemrc
  fi

  curl -sSL https://get.rvm.io | bash -s $1

  source /home/vagrant/.rvm/scripts/rvm
fi