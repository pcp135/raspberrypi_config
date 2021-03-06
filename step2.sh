#!/bin/bash

# Update Software
sudo apt-get update -y
sudo apt-get upgrade -y

# Setup new user
sudo adduser phil
sudo adduser phil pi
sudo adduser phil sudo
sudo adduser phil www-data
if [ ! -f /home/phil/authorized_keys ]; then
	sudo mkdir /home/phil/.ssh
	sudo touch /home/phil/.ssh/authorized_keys
	sudo chown -R phil /home/phil/.ssh
	sudo chgrp -R phil /home/phil/.ssh
fi

# Install apps
sudo apt-get install screen -y
sudo apt-get install emacs -y
sudo apt-get install python-pip -y

#Switch to Phil
su phil
