#!/bin/bash

name=${1}

if [ "${1}" == "vi" ]; then
	name=" "
elif [ "${1}" == "vim" ]; then
	name=" "
elif [ "${1}" == "zsh" ]; then
	name=" "
elif [ "${1}" == "npm" ]; then
	name=" "
elif [ "${1}" == "python" ]; then
	name=" "
elif [ "${1}" == "node" ]; then
	name=" "
elif [ "${1}" == "tig" ]; then
	name=" "
fi

# echo "#[fg=colour169, bg=colour235]#[fg=colour255, bg=colour169] #I ⮁ #W $name #[fg=colour169, bg=colour235]"
if [ "${2}" == "current" ]; then
  echo "#[fg=colour169, bg=colour235]#[fg=colour255, bg=colour169] #I $name #[fg=colour169, bg=colour235]"
else
  # echo "#[fg=colour169, bg=colour235]#[fg=colour255, bg=colour169] #I $name #[fg=colour169, bg=colour235]"
  echo "#I $name"
fi

# echo $1
# tmux set-window-option -g window-status-current-format "#[fg=colour169, bg=colour235]#[fg=colour255, bg=colour169] #I ⮁ #W #[fg=colour169, bg=colour235]"

