#!/bin/bash

install_pkg() {
    dpkg-query -s $1 &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Already installed $1"  
    else
        echo "Installing $1"  
        sudo apt install -y $1
    fi
}

create_link() {
    if [ -e "$2" ]; then
        echo "$2 already exists, can't create link with $1"
        exit 1
    else
        # sudo ln -s $1 $2
        ln -s $1 $2
        echo "Creating link from $1 to $2"
    fi
}
