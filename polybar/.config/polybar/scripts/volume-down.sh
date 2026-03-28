#!/bin/bash
current=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP "\d+%" | head -1 | tr -d "%")

if [ "$current" -gt 0 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
fi

new=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP "\d+%" | head -1 | tr -d "%")

notify-send -h int:value:$new -r 9999 "Volume" ""
