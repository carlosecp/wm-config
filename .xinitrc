# vim: ft=sh
session=${1:-awesome}

xset -dpms
xset s off

xrandr --auto --output eDP-1 --right-of DP-1
xrdb -load /home/carlosecp/.Xresources

xbindkeys
xinput set-prop 13 313 0
xinput set-prop 17 336 1
xinput set-prop 17 313 1
libinput-gestures-setup start

pcmanfm -d &

picom --experimental-backends &

case $session in
    awesome) exec awesome ;;
esac
