#!/bin/bash

cd /var/www
sudo chown phil: .
sudo rm -r *
wget http://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz

EXPECTED_ARGS=2
E_BADARGS=65
MYSQL=`which mysql`
 
Q1="CREATE DATABASE IF NOT EXISTS wordpress;"
Q2="GRANT ALL ON wordpress.* TO '$1'@'localhost' IDENTIFIED BY '$2';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
 
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbuser dbpass"
  exit $E_BADARGS
fi

echo "Enter the password for the DB admin to create the database" 
$MYSQL -uroot -p -e "$SQL"