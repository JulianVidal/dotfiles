#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/dotfiles ~/ ~/.config ~/code -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if tmux has-session -t=$selected_name 2> /dev/null; then
    tmux switch-client -t $selected_name
    exit 0
fi

tmux new-session -ds $selected_name -c $selected
tmux new-window -t $selected_name:1 -n term -c $selected
tmux send-keys -t $selected_name:0 "nvim ." C-m
tmux select-window -t $selected_name:0
tmux rename-window -t $selected_name:0 nvim

if [[ -z $TMUX ]]; then
    tmux attach-session -t $selected_name
else
    tmux switch-client -t $selected_name
fi

