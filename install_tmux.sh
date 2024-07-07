#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines
source ./utils.sh # Sources useful functions

# Create links to relevant dotfiles
create_link ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Updating apt before installing packages
echo "Updating apt"
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Installs packages
echo "Installing git, tmux"
install_pkg "git"
install_pkg "tmux"

# Installs Tmux Plugin Manager
TPM=~/.tmux/plugins/tpm
if [ -d "$TPM" ]; then
    echo "The $TPM folder already exists, might already be installed"
else
    echo "Installing TPM"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
