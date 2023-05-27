# This file is used to startup window manager. After that
# i3wm is responsible for running things

# Place where is your config sotred is... :
export CONFIGDIR="$HOME/.config"

# Place where is your .zshrc
export ZDOTDIR="$CONFIGDIR/zsh"

# Set path for scripts
export PATH=$PATH:$CONFIGDIR/scripts

# Running i3

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx /usr/bin/i3
fi
