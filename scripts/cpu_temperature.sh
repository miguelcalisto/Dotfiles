#!/bin/bash

cpu_temps=$(sensors | grep 'Core' | awk '{print $3}' | sed 's/+//g' | sed 's/°C//g')

sum=0
count=0
for temp in $cpu_temps; do
    sum=$(echo "$sum + $temp" | bc)
    count=$((count + 1))
done

if [ "$count" -gt 0 ]; then
    cpu_temp=$(echo "scale=0; $sum / $count" | bc)
else
    cpu_temp="0"
fi

echo "  <b>CPU: ${cpu_temp}°C</b> "
