# vim: ft=sh
session=${1:-awesome}

xset -dpms
xset s off
xrandr --auto --output eDP-1 --right-of DP-1
flameshot &
xrdb -load /home/carlosecp/.Xresources
pcmanfm -d

case $session in
    awesome)
        xbindkeys
        libinput-gestures-setup start
        picom --experimental-backends &
        exec awesome
        ;;
esac
