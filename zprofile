# This file is used to startup window manager. After that
# i3wm is responsible for running things

# Creating symlink to zshrc
export ZDOTDIR="$HOME/git/dotfiles/zsh"


# Running i3

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx /usr/bin/i3
fi
