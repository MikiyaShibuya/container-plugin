#!/bin/bash

su $USER -c "git clone https://github.com/MikiyaShibuya/dotfiles.git /tmp/dotfiles"
cd /tmp/dotfiles
su $USER -c "git checkout dev"

./install.sh

chsh $USER -s /bin/zsh

su $USER -c "echo '/tmp/container-plugin/bind_cache.sh' >> /home/$USER/.zshrc"
su $USER -c "echo 'source /tmp/container-plugin/avoid_proxy.sh' >> /home/$USER/.zshrc"
