#!/bin/bash
pactl set-sink-mute @DEFAULT_SINK@ toggle

muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o "yes\|no")

if [ "$muted" = "yes" ]; then
    notify-send -r 9999 "Volume" "Mutado"
else
    notify-send -r 9999 "Volume" "Desmutado"
fi
