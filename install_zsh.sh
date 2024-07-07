#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines
source ./utils.sh # Sources useful functions

# Updating apt before installing packages
echo "Updating apt"
sudo apt update
sudo apt upgrade
sudo apt autoremove

# Create links to relevant dotfiles
create_link ~/dotfiles/zsh/.zshrc ~/.zshrc
create_link ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# Installs packages
echo "Installing zsh, git and curl"
install_pkg "zsh"
install_pkg "git"
install_pkg "curl"

# Useful default variables for installation
ZSH=~/.oh-my-zsh
ZSH_CUSTOM=~/.oh-my-zsh/custom

# Installs oh my zsh
if [ -d "$ZSH" ]; then
    echo "The $ZSH folder already exists, might already be installed"
else
    echo "Installing Oh My Zsh and keeping linked .zshrc"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
fi

# Installs zsh-autosuggestsions plugin
ZSH_AUTOSUG=$ZSH_CUSTOM/plugins/zsh-autosuggestions
if [ -d "$ZSH_AUTOSUG" ]; then
    echo "The $ZSH_AUTOSUG folder already exists"
else
    echo "Installing zsh-autosuggestions plugin"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_AUTOSUG
fi

# Installs zsh-syntax-highlighting plugin
ZSH_SYNTAX=$ZSH_CUSTOM/plugins/zsh-syntax-highlighting
if [ -d "$ZSH_SYNTAX" ]; then
    echo "The $ZSH_SYNTAX folder already exists"
else
    echo "Installing zsh-syntax-highlighting plugin"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_SYNTAX
fi

# Installs powerlevel10k
ZSH_POWER=$ZSH_CUSTOM/themes/powerlevel10k
if [ -d "$ZSH_POWER" ]; then
    echo "The $ZSH_POWER folder already exists, might already be installed"
else
    echo "Installing powerlevel10k"
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_POWER
fi


