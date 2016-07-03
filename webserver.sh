#!/bin/bash

# Install webserver
sudo apt-get install lighttpd -y
sudo apt-get install php5-common php5-cgi php5 -y
sudo apt-get install mysql-server php5-mysql -y
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload

#Set permissions on the web path
sudo cp $HOME/raspberrypi_config/.htaccess /var/www/
cd /var/www
sudo chown phil: .
sudo rm -r *
