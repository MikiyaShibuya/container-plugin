#!/bin/bash

# Get issuer by getting google.com with ssl
ISSUER=$(curl -v https://google.com 2>&1 | grep issuer | sed 's/.*O=//g;s/ .*//g')

# Nothing to do when no proxy is not detected
if [ $ISSUER = "Google" ]; then
  exit
fi

# If non-google issuer detected, proxy is activated

CA_DIR=/usr/local/share/ca-certificates
CA_FILE=$(ls ${CA_DIR}/*.crt | awk '{print $1}')

npm config set cafile $CA_FILE
export NODE_TLS_REJECT_UNAUTHORIZED=0
pip config set global.cert $CA_FILE &> /dev/null
