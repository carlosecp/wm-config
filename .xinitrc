# vim: ft=sh
session=${1:-awesome}

xset -dpms
xset s off
xrandr --auto --output eDP1 --right-of DP1
emacs --daemon &
flameshot &
xrdb -load /home/carlosecp/.Xresources

case $session in
    awesome)
        xbindkeys
        libinput-gestures-setup start
        picom --experimental-backends &
        exec awesome
        ;;
    xmonad)
        xbindkeys
        libinput-gestures-setup start
        picom --experimental-backends &
        xsetroot -cursor_name left_ptr &
        feh --bg-scale /home/carlosecp/.wallpapers/nord_macos.png &
        exec xmonad
        ;;
esac
