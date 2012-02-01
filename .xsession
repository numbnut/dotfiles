#!/bin/bash
# This trayer is for xmonad + xmobar and holds things as transmission, wicd, etc.
trayer --edge top --align center --SetDockType true --SetPartialStrut true \
    --expand true --width 10 --transparent true --tint 0x000000 --height 11&
xterm &
pcmanfm &
gvim &
skype &
pidgin &
firefox &
# wicd-client &
# blueman
sleep 5 &
thunderbird &
# Set X background color to black and foreground color to white
xsetroot -solid black &
exec xmonad
