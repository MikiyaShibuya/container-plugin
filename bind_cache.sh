#!/bin/bash

function bind_cache() {
  DIR=$1
  MOUNT=$2
  if [ ! -h ${DIR} ]; then
    if [ -e ${DIR} ]; then
      mv ${DIR} ${DIR}_org
      if [ ! -e ~/host-cachedir/${DIR} ]; then
        cp -rf ${DIR}_org ~/host-cachedir/$MOUNT
      fi
    fi

    mkdir -p ~/host-cachedir/$MOUNT
    ln -s ~/host-cachedir/$MOUNT ${DIR}
  fi
}

bind_cache ~/.cache _cache
bind_cache ~/.config/coc _config_coc
bind_cache ~/.config/nvim/tmp _config_nvim_tmp
