#!/bin/bash

if [ ! -d $HOME/raspberrypi_config ]; then
	cd $HOME
	git clone https://github.com/pcp135/raspberrypi_config.git
	ln -sb $HOME/raspberrypi_config/.screenrc $HOME
fi

#Identify with github
git config --global user.name "Phil Parsons"
git config --global user.email phil@parsons.uk.com

# Generate new key with no passphrase if necessary
if [ ! -f /home/phil/.ssh/id_rsa.pub ]; then
	ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
fi

# Output rsa key to screen for copying into git
cat ~/.ssh/id_rsa.pub
