#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

DESC=$(calcurse -n | tail -n 1 | sed 's/\[.*\] //')

if [[ -z "$DESC" ]]; then
    DESC="Compromisso agora!"
fi

paplay /usr/share/sounds/freedesktop/stereo/service-login.oga &

#notify-send -u critical -t 0 "📅 Calcurse" "$DESC"
notify-send -a "calcurse" -u critical -t 0 "📅 Calcurse" "$DESC"
