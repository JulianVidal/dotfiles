#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

# Directory paths
WINTERM="/mnt/c/Users/JuliV/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

WINTERMDOT="~/dotfiles/windows_terminal/settings.json"

echo "Copying from $WINTERM to $WINTERMDOT"

# Copies the windows terminal settings into dotfiles
cp $WINTERM $WINTERMDOT
