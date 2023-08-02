#!/bin/sh

# Read the first three lines of i3status and print them out
i3status | (
    read line && echo "$line"
    read line && echo "$line"
    read line && echo "$line"

    # Continuously read the i3status output line by line and add weather and pomodoro information to it
    while true; do
        read line

        string_to_show=""
        # Get weather information from a cache file and format it
        weather_input=$(cat ~/.weather.cache | cut -d ':' -f 2)
        temperature=$(echo $weather_input | cut -d ' ' -f 2)
        wind_speed=$(echo $weather_input | cut -d ' ' -f 3)
        weather="$temperature | $wind_speed"

        # Get pomodoro status and format it
        pomodoro_input=$(i3-gnome-pomodoro status | cut -d ' ' -f 2)
        if [ "$pomodoro_input" = "" ]; then
            pomodoro="🍅 00:00"
        else
            pomodoro="🍅 $pomodoro_input"
        fi

        string_to_show="$pomodoro | $weather"
        # Concatenate weather and pomodoro information and add it to the i3status output
        # concatenation="$pomodoro |$weather"
        # echo ",[{\"full_text\":\"$pomodoro\" },${line#,\[}" || exit
        echo ",[{\"full_text\":\"$string_to_show\" },${line#,\[}" || exit
    done
)
