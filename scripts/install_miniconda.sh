#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

# Installation instructions from https://docs.anaconda.com/miniconda/
CONDA=~/miniconda3
if [ -d "$CONDA" ]; then
    echo "The $CONDA folder already exists, might already be installed"
else
    echo "Installing Miniconda3 and keeping linked .zshrc"
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
fi
