#!/bin/bash

caps_state=$(xset q | grep "Caps Lock:" | awk '{print $4}')

if [ "$caps_state" = "on" ]; then

    echo "<span underline='single' font_weight='bold' size='18000' background='white'> CAPS </span>"
else
    echo ""
fi
