#!/bin/bash

su $USER -c "git clone https://github.com/MikiyaShibuya/dotfiles.git /tmp/dotfiles"
cd /tmp/dotfiles
su $USER -c "git checkout dev"

./install.sh
