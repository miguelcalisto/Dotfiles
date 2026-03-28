#!/bin/bash

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

DAYS_BACK=7
now=$(date +%s)
limit_epoch=$((now - DAYS_BACK * 86400))

current_date=""
task_epoch=""
task_time=""

calcurse -a --days -$DAYS_BACK | while read -r line; do

if echo "$line" | grep -qE '^[0-9]{2}/[0-9]{2}/[0-9]{2}:$'; then
    current_date="${line%:}"
    continue
fi

if echo "$line" | grep -qE '[0-9]{2}:[0-9]{2} ->'; then
    task_time=$(echo "$line" | grep -oE '[0-9]{2}:[0-9]{2}' | head -n 1)
    task_epoch=$(date -d "$current_date $task_time" +%s 2>/dev/null)
    continue
fi

if [ -n "$line" ] && [ "$line" != "--" ] && [ -n "$task_epoch" ]; then
    task_desc=$(echo "$line" | xargs)

    if [ "$task_epoch" -lt "$now" ] && [ "$task_epoch" -ge "$limit_epoch" ]; then
        pretty_date=$(date -d "$current_date" "+%d/%m/%Y")

        notify-send \
            -a "calcurse" \
            -u critical \
            -t 0 \
            "⏰ Agendamento perdido" \
            "$pretty_date $task_time\n$task_desc"
    fi

    unset task_epoch
    unset task_time
fi
done
