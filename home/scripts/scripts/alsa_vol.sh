#!/bin/bash

volume=$(amixer get Master | grep -oP '\[\d+%\]' | head -1 | tr -d '[]')
status=$(amixer get Master | grep -oP '\[(on|off)\]' | head -1 | tr -d '[]')

if [ "$status" = "off" ]; then
    echo " 🔇 <span color='#FFB86C'><b>Mutado</b></span> "
else
    echo " 🔊 <span color='#FFB86C'><b>${volume}</b></span> "
fi

