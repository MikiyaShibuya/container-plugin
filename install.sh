#!/bin/bash

set -e

HOMEDIR=$(eval echo ~$USER)
REPO_URL=https://github.com/MikiyaShibuya/dotfiles.git
su $USER -c "mkdir -p $HOMEDIR/.local/share"
if [ ! -d "$HOMEDIR/.local/share/dotfiles" ]; then
    su $USER -c "git clone $REPO_URL $HOMEDIR/.local/share/dotfiles"
fi
cd $HOMEDIR/.local/share/dotfiles
su $USER -c "git checkout 39cc70c"

USER=$USER ./install.sh

chsh $USER -s /bin/zsh

su $USER -c "echo '/tmp/container-plugin/bind_cache.sh' >> /home/$USER/.zshrc"
su $USER -c "echo 'source /tmp/container-plugin/avoid_proxy.sh' >> /home/$USER/.zshrc"
