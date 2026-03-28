#!/bin/bash

PATH=/usr/local/bin:/usr/bin:/bin
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

NOW=$(date +%s)
MAX_DIAS=7

calcurse -a --days $MAX_DIAS | while read -r line; do
if [[ "$line" =~ ^[0-9]{2}/[0-9]{2}/[0-9]{2}:$ ]]; then
    DATA="${line%:}"
    continue
fi

if echo "$line" | grep -qE '[0-9]{2}:[0-9]{2} ->'; then
    HORA=$(echo "$line" | grep -oE '[0-9]{2}:[0-9]{2}' | head -n1)
    EPOCH=$(date -d "$DATA $HORA" +%s 2>/dev/null)
    continue
fi

if [[ -n "$line" && -n "$EPOCH" ]]; then
    DESC=$(echo "$line" | xargs)

    DIAS=$(((EPOCH - NOW) / 86400))

    if [[ "$DIAS" -ge 0 && "$DIAS" -le "$MAX_DIAS" ]]; then
        if [[ "$DIAS" -eq 0 ]]; then
            MSG="📅 É hoje!"
        elif [[ "$DIAS" -eq 1 ]]; then
            MSG="📅 Falta 1 dia"
        else
            MSG="📅 Faltam $DIAS dias"
        fi

        notify-send -a "calcurse" -t 0 "$MSG" \
            "$(date -d "$DATA" '+%d/%m/%Y') $HORA\n$DESC"

    fi

    unset EPOCH
fi
done
