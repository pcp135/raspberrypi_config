#!/bin/bash

# Update Software
sudo apt-get update -y
sudo apt-get upgrade -y

# Setup new user
sudo adduser phil
sudo adduser phil pi 
sudo adduser phil sudo
if [ ! -f /home/phil/authorized_keys ]; then
	sudo mkdir /home/phil/.ssh
	sudo touch /home/phil/authorized_keys
fi

# Install apps
sudo apt-get install screen -y
sudo apt-get install emacs -y
sudo apt-get install apache2 -y
sudo apt-get install mysql -y

#Switch to Phil and link in dotfiles
su phil
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