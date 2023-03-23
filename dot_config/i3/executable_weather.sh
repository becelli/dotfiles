#!/bin/sh

i3status | (read -r line && echo "$line" && read -r line && echo "$line" && read -r line && echo "$line" && while :; do
  read -r line
  # status=$(cat ~/.weather.cache | head -n 3 | tail -n 1 | cut -c 16- | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
#  status=$(cat ~/.weather.cache | head  # Remove the "Pomodoro word and substitute with a 🍅"
  pomodoro=$(i3-gnome-pomodoro status | sed 's/Pomodoro/🍅/g')

  # print both weather and pomodoro
 echo ",[{\"full_text\":\"${status}\",\"color\":\"#FFFFFF\" },${line#,\[}" || exit 1

done)
