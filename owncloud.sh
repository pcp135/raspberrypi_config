#!/bin/bash

if [ ! -f owncloud-7.0.2.tar.bz2 ]; then
	wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2
fi
wget https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2.md5
md5sum owncloud-7.0.2.tar.bz2
cat owncloud-7.0.2.tar.bz2.md5