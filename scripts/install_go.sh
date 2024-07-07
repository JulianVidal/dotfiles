#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines
source ./utils.sh # Sources useful functions

GO=/usr/local/go
if [ -d "$GO" ]; then
    echo "The $GO folder already exists"
else
    echo "Installing Go"
    wget https://go.dev/dl/go1.22.5.src.tar.gz
    sudo tar -xvf go1.21.3.linux-amd64.tar.gz
    sudo mv go /usr/local
fi
