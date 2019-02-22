#!/usr/bin/env bash

tmpbg='/tmp/screen.jpeg'
outbg='/tmp/screen.png'
scrot "$tmpbg"

$HOME/NixConfig/img_scale "$tmpbg" "$outbg"
i3lock -i "$outbg"

rm "$tmpbg"
rm "$outbg"
