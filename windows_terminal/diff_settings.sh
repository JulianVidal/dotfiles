#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

if [ -z "$1" ]; then
	echo "Please supply a username"
	exit 1
fi

# Directory paths
WINTERM=/mnt/c/Users/$1/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json

WINTERMDOT=~/dotfiles/windows_terminal/settings.json

echo "Comparing dotfile to window terminal"
diff $WINTERMDOT $WINTERM
