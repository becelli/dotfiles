#!/usr/bin/env bash

i3status -c ~/.config/i3status/i3status.conf | while :; do
  read line
  pomodoro=$(i3-gnome-pomodor status)
  echo "$pomodoro| $line" || exit 1
done
