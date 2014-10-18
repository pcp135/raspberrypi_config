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
fi

# Install apps
sudo apt-get install screen -y
sudo apt-get install emacs -y
sudo apt-get install lightppd -y
sudo apt-get install php5-common php5-cgi php5 -y
sudo apt-get install mysql-server php5-mysql -y
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload

#Switch to Phil
su phil
