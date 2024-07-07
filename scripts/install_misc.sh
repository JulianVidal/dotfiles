#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines
source ~/dotfiles/scripts/utils.sh # Sources useful functions

# Updating apt before installing packages
echo "Updating apt"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

# Installs packages
echo "Installing fzf"
install_pkg fzf
