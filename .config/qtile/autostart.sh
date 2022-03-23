#!/bin/sh

picom &
light-locker --lock-on-lid &
dunst &
xwallpaper --stretch ~/Pictures/Wallpapers/arco-wallpaper.jpg &
nm-applet &
volumeicon &
lxsession &

