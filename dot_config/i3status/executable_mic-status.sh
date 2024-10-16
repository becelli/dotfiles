#!/bin/bash

# Get the microphone status
status=$(amixer get Capture | grep -o '\[on\]')

# Check if the microphone is muted or unmuted
if [ "$status" = "[on]" ]; then
  echo "🎙️"
else
  echo "🔇"
fi
