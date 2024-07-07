#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines
source ~/dotfiles/scripts/utils.sh # Sources useful functions

# Updating apt before installing packages
echo "Updating apt"
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Installs packages
install_pkg curl

if command -v nvm &>/dev/null; then
    echo "Already installed nvm"
else
    echo "Installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi

