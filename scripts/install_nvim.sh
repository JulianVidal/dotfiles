#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines
source ./utils.sh # Sources useful functions

# Updating apt before installing packages
echo "Adding neovim repository"
sudo add-apt-repository ppa:neovim-ppa/unstable -y

echo "Updating apt"
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Create links to relevant dotfiles
create_link ~/dotfiles/kickstart.nvim ~/.config/nvim

# Installs packages
echo "Installing make, gcc, ripgrep, unzip, git, xclip and neovim"
install_pkg make
install_pkg gcc
install_pkg ripgrep
install_pkg unzip
install_pkg git
install_pkg xclip
install_pkg neovim

# Nerd Font is enabled in my configuration
echo "Make sure you have FiraMono Nerd Font installed or any Nerd Font"
