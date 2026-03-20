setxkbmap -variant dvorak
xrandr --output DP-1 --mode 2560x1440 --rate 240
xrdb -merge ~/.Xresources
xset m 0 0
xsetroot -cursor_name left_ptr

exec bspwm
