#!/bin/bash

if [ ! -f /home/phil/raspberrypi_config ]; then
	git clone https://github.com/pcp135/raspberrypi_config.git
	ln -sb raspberrypi_config/.screenrc .
fi

#Identify with github
git config --global user.name "Phil Parsons"
git config --global user.email phil@parsons.uk.com

if [ ! -f /home/phil/.ssh/id_rsa.pub ]; then

	# Generate new key with no passphrase
	ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''

	# Output rsa key to screen for copying into git
	cat ~/.ssh/id_rsa.pub
fi