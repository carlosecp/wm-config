xset -dpms
xset s off
xbindkeys
libinput-gestures-setup start
xrandr --auto --output eDP1 --right-of DP1
picom --experimental-backends &
flameshot &
emacs --daemon &

exec awesome
# exec xmonad
