# vim: ft=sh
session=${1:-awesome}

xset -dpms
xset s off

xrandr --auto --output eDP1 --right-of DP1
xrdb -load /home/carlosecp/.Xresources

picom --experimental-backends &

xbindkeys
xinput set-prop "pointer:Logitech MX Master 3" "libinput Natural Scrolling Enabled" 0
xinput set-prop "pointer:DELL07EC:00 06CB:7E92 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "pointer:DELL07EC:00 06CB:7E92 Touchpad" "libinput Natural Scrolling Enabled" 1
libinput-gestures-setup start

pcmanfm -d &
flameshot &

case $session in
    awesome) exec awesome ;;
esac
