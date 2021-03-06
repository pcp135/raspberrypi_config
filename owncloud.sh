#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65
MYSQL=`which mysql`

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbuser dbpass"
  exit $E_BADARGS
fi

cd /var/www/
if [ ! -f owncloud-8.0.4.tar.bz2 ]; then
	sudo wget https://download.owncloud.org/community/owncloud-9.0.4.tar.bz2
fi
sudo wget https://download.owncloud.org/community/owncloud-9.0.4.tar.bz2.md5
sudo wget https://download.owncloud.org/community/owncloud-9.0.4.tar.bz2.asc
sudo wget https://owncloud.org/owncloud.asc
file1=`cut -d" " -f1 owncloud-9.0.4.tar.bz2.md5`
file2=`md5sum owncloud-9.0.4.tar.bz2 | cut -d" " -f1`

if [ $file1 != $file2 ]
then
  echo "md5 sums mismatch"
	exit
else
  echo "md5 checksum OK"
fi

echo "GPG verification output"
gpg --import owncloud.asc
gpg --verify owncloud-9.0.4.tar.bz2.asc owncloud-9.0.4.tar.bz2

sudo tar -xjf owncloud-9.0.4.tar.bz2
sudo rm owncloud-9.0.4.tar.bz*
sudo rm owncloud.as*

sudo apt-get install php5-gd -y
sudo chown www-data:www-data owncloud
sudo chown www-data:www-data owncloud/config
sudo chown -R www-data:www-data owncloud/apps
sudo mkdir /mnt/owncloud-data
sudo chown -R www-data:www-data /mnt/owncloud-data
sudo chmod -R 770 /mnt/owncloud-data

Q1="CREATE DATABASE IF NOT EXISTS owncloud2;"
Q2="GRANT ALL ON owncloud2.* TO '$1'@'localhost' IDENTIFIED BY '$2';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

echo "Enter the password for the DB admin to create the database"
$MYSQL -uroot -p -e "$SQL"

echo "Now visit the website to finish the setup"
