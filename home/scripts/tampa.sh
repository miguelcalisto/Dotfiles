#!/bin/bash

LID_STATE=$(cat /proc/acpi/button/lid/LID*/state | awk '{print $2}')

if [ "$LID_STATE" = "open" ]; then
    xrandr --output HDMI-1 --primary --auto --output eDP-1 --auto --right-of HDMI-1
else
    xrandr --output HDMI-1 --primary --auto --output eDP-1 --off
fi
