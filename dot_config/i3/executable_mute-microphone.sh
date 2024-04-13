#!/bin/bash

# Toggle microphone mute on/off
#
amixer set Capture toggle

# get current microphone status and notify
status=$(amixer get Capture | grep '\[off\]')
if [ -n "$status" ]; then
	notify-send -t 500 -i microphone-sensitivity-muted-symbolic "😶 Microphone muted 😶"
else
	notify-send -t 500 -i microphone-sensitivity-high-symbolic "🎙️ Microphone unmuted 🎙️"
fi
