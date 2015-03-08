 #!/usr/bin/env bash

set -e

if [[ -e "/home/vagrant/.rvm/scripts/rvm" ]]
then
    source /home/vagrant/.rvm/scripts/rvm
    rvm use --install $1

	shift

	if (( $# ))
	then gem install $@
	fi
else
	echo "RVM not found! Run install-rvm.sh first."
	exit 1
fi