#!/bin/bash

sudo adduser --system --shell /bin/bash --gecos 'git version control by pi' --group --home /home/git git

echo "Enter a new password for the git user"
passwd git
