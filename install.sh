#!/bin/bash

HOMEDIR=$(eval echo ~$USER)
REPO_URL=https://github.com/MikiyaShibuya/dotfiles.git
su $USER -c "mkdir -p $HOMEDIR/.local/share"
su $USER -c "git clone $REPO_URL --depth=1 $HOMEDIR/.local/share/dotfiles"
cd $HOMEDIR/.local/share/dotfiles
su $USER -c "git checkout f41996d"

USER=$USER ./install.sh

chsh $USER -s /bin/zsh

su $USER -c "echo '/tmp/container-plugin/bind_cache.sh' >> /home/$USER/.zshrc"
su $USER -c "echo 'source /tmp/container-plugin/avoid_proxy.sh' >> /home/$USER/.zshrc"
