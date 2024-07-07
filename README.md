# Dot files

This is a collection of my dotfiles, this way I can easily manage, update and install all of my configurations between different machines.

I have looked at different solutions for this problem, for example:
* git + stow
* git bare
* chezmoi
* YADM
* home-manager
* etc...

I didn't like the idea of having to install software to manage my dotfiles, as my use case is quite simple so git should be enough. I wasn't quite convinced of git bare as I wanted more control on how things were installed and store. For instance, my alacritty is installed in Windows and I then use WSL so my alacritty configuration would be in Windows not in my home directory. Git bare works on the home directory, same issue with stow, it assumes everything you want to store will be in the home directory.

I have chosen to move to a more bespoke solution, as I would like this repo to also store a list of everything I need to install to get my setup going (i.e. zsh, oh-my-zsh, tmux). I want to keep some sort of installation instruction to use in the future. 

# Solution

Use symbolic links like stow, but I will manually write were they need to go and have a script create the symlinks. Very similar to stow, but I don't need to keep the file structure in my repo the same as the home directory, I can put everything to do with zsh in one directory.

What I want to do:
* For each program I use:
    * The configuration files
    * How to install it
    * Any notes that I want to make

My neovim setup will work differently, since I have forked the Kickstart.nvim repo and would like to keep the fork in case of future updates. I will use git submodules.


# Installation

List of programs that I install for my setup:
* zsh - instead of bash, don't know the difference
    * oh-my-zsh - for zsh configurations, don't know what it does exactly
    * p10k - for prompt, formats the prompt could use starship
* tmux - Terminal multiplexer, multiple sessions, windows and panes
    * tpm - tmux plugin manager, for add plugins
        * tmux-navigator - for navigating between neovim and tmux panes
        * vi keybinds
        * Navigation keybinds
* neovim
    * kickstart.nvim submodule
        * ripgrep
        * unzip
        * gcc
* windows terminal settings
* git
* fzf
* miniconda3 - python version manager
* go - go
* nvm - node version manager
* Fira mono nerd font - Maybe change to another, no real preference

