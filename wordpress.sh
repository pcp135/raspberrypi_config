#!/bin/bash

cd /var/www
sudo chown phil: .
sudo rm -r *
wget http://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz

EXPECTED_ARGS=1
E_BADARGS=65
MYSQL=`which mysql`
 
Q1="CREATE DATABASE IF NOT EXISTS wordpress;"
Q2="GRANT ALL ON *.* TO 'wordpress'@'localhost' IDENTIFIED BY '$1';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
 
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbpass"
  exit $E_BADARGS
fi
 
$MYSQL -uroot -p -e "$SQL"