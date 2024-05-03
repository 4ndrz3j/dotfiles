# This file is used to startup window manager. After that
# i3wm is responsible for running things

# Place where is your config sotred is... :
export CONFIGDIR="$HOME/.config"
export XDG_CONFIG_HOME="$HOME/.config"

# Place where is your .zshrc
export ZDOTDIR="$CONFIGDIR/zsh"

# Set path for scripts
export PATH=$PATH:$CONFIGDIR/scripts

# Running i3

#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx /usr/bin/i3
#fi

# run sway

exec sway

# Check if we are ruinnig wayland

if ["$XDG_SESSION_TYPE" = "wayland" ] ; then
    export MOZ_ENABLE_WAYLAND=1
    export SDL_VIDEODRIVER=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1
    export QR_QPA_PLATFORM=sway
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
fi
