#!/bin/bash

if [ ! -f owncloud-7.0.2.tar.bz2 ]; then
	wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2
fi
wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2.md5
$file1=`cut -d" " -f1 owncloud-7.0.2.tar.bz2.md5`
$file2=`md5sum owncloud-7.0.2.tar.bz2 | cut -d" " -f1`

if [ $file1 != $file2 ]
then
  echo "md5 sums mismatch"
	exit
else
  echo "checksums OK"
fi
