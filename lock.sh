#!/usr/bin/env bash

# icon="$HOME/.xlock/icon.png"
tmpbg='/tmp/screen.png'
scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
# convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#i3lock -u -i "$tmpbg"
i3lock -i "$tmpbg"
