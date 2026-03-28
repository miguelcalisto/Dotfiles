#!/bin/bash
battery_status=$(acpi -b | grep -oP '\w+' | head -n1)
battery_percentage=$(acpi -b | grep -oP '\d+%' | head -n1)
echo " 🔋 <b>$battery_status $battery_percentage</b> "

