#!/usr/bin/env bash

tmpbg='/tmp/screen.png'

scrot "$tmpbg"
convert "$tmpbg" -blur 0x8 -colorspace Gray "$tmpbg"
i3lock -i "$tmpbg"
rm "$tmpbg"
