#!/bin/bash

# Update Software
sudo apt-get update -y
sudo apt-get upgrade -y

# Setup new user
sudo adduser phil
sudo adduser phil pi 
sudo adduser phil sudo
sudo mkdir /home/phil/.ssh
sudo touch /home/phil/authorized_keys

# Install apps
sudo apt-get install screen -y
sudo apt-get install emacs -y
sudo apt-get install apache2 -y
sudo apt-get install mysql -y

#Switch to Phil and link in dotfiles
su phil
git clone https://github.com/pcp135/raspberrypi_config.git
ln -sb raspberrypi_config/.screenrc .

#Identify with github
git config --global user.name "Phil Parsons"
git config --global user.email phil@parsons.uk.com

# Generate new key with no passphrase
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''

# Output rsa key to screen for copying into git
cat ~/.ssh/id_rsa.pub