VM=false

if [[ $VM == true ]]; then
    # Run compositor
    #picom -b --backend xrender --no-vsync
    # Set wallpaper
    feh --no-fehbg --bg-fill ~/.config/wallpaper/wallpaper_2.png
    # Run dunst
    dunst &
    # Set keyboard scheme
    setxkbmap pl 
    # screen lock
    xset s on; xset s 600 605 ; xss-lock --transfer-sleep-lock -- i3lock -eu -c ff06b5 --nofork
    # Run spiece-vdagent to allow copy&paste text between machines. Change spice address to 'none'
    (exec spice-vdagent &)
    (exec nm-applet &)

fi

if [[ $VM == false ]]; then
    # Run compositor
    picom -b --backend glx --vsync
    # Set wallpaper
    feh --no-fehbg --bg-fill ~/.config/wallpaper/wallpaper_1.jpg
    # Run dunst
    dunst &
    # Set keyboard scheme
    setxkbmap pl &
    # screen lock
    xset s on; xset s 600 605 ; xss-lock --transfer-sleep-lock -- i3lock -eu -c 000000 --nofork;
    (exec nm-applet &)
fi
