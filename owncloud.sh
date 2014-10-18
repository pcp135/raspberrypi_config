#!/bin/bash

mkdir /var/www/owncloud
cd /var/www/owncloud
if [ ! -f owncloud-7.0.2.tar.bz2 ]; then
	wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2
fi
wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2.md5
wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2.asc
wget https://owncloud.org/owncloud.asc
file1=`cut -d" " -f1 owncloud-7.0.2.tar.bz2.md5`
file2=`md5sum owncloud-7.0.2.tar.bz2 | cut -d" " -f1`

if [ $file1 != $file2 ]
then
  echo "md5 sums mismatch"
	exit
else
  echo "md5 checksum OK"
fi

echo "GPG verification output"
gpg --import owncloud.asc
gpg --verify owncloud-7.0.2.tar.bz2.asc owncloud-7.0.2.tar.bz2