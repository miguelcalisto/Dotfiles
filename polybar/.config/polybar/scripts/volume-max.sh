#!/bin/bash
pactl set-sink-volume @DEFAULT_SINK@ 100%


notify-send -h int:value:100 -r 9999 "Volume" ""
