
export GIT_EDITOR=$VIM
export DOTFILES=$HOME/dotfiles
export GOPATH="$HOME/go"


# set PATH so it includes go
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

bindkey -s ^f "~/dotfiles/tmux/muxi.sh\n"
. "$HOME/.cargo/env"
