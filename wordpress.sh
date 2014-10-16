#!/bin/bash

cd /var/www
sudo chown phil: .
rm *
wget http://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz