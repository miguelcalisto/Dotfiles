#!/bin/bash

temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)

if [ -z "$temp" ]; then
    echo "N/A"
else
    echo "$((temp / 1000))°C"
fi
