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

#Switch to Phil
su phil
