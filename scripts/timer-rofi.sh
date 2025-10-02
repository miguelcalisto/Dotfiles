#!/bin/bash

PID_FILE="/tmp/rofi-timer.pid"
END_FILE="/tmp/rofi-timer.end"

# Função para calcular tempo restante
get_remaining_time() {
    if [ -f "$END_FILE" ]; then
        END_TS=$(cat "$END_FILE")
        NOW_TS=$(date +%s)
        REMAINING=$((END_TS - NOW_TS))

        if [ "$REMAINING" -gt 0 ]; then
            MIN=$((REMAINING / 60))
            SEC=$((REMAINING % 60))
            printf "%02dm %02ds" "$MIN" "$SEC"
        else
            echo "Expirado"
        fi
    else
        echo "Desconhecido"
    fi
}

# Verifica se já existe um timer ativo
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if ps -p "$PID" > /dev/null 2>&1; then
        TIME_LEFT=$(get_remaining_time)
        CANCEL=$(rofi -dmenu -p "Timer ativo (restam $TIME_LEFT). Cancelar? [y/N]" <<< "")
        if [[ "$CANCEL" =~ ^[Yy]$ ]]; then
            kill "$PID" && notify-send "⏹️ Timer cancelado"
            rm -f "$PID_FILE" "$END_FILE"
        fi
        exit 0
    else
        # PID não existe mais
        rm -f "$PID_FILE" "$END_FILE"
    fi
fi

# Solicita o tempo em minutos
TIME=$(rofi -dmenu -p "Timer (min):" <<< "")
[[ -z "$TIME" ]] && exit 1

# Valida se é um número positivo
if ! [[ "$TIME" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    notify-send "Timer" "Entrada inválida: $TIME"
    exit 1
fi

# Converte para segundos (truncando)
SECONDS=$(awk "BEGIN { printf \"%d\", $TIME * 60 }")

# Define o horário de término
END_TIMESTAMP=$(date -d "+$SECONDS seconds" +%s)
echo "$END_TIMESTAMP" > "$END_FILE"
END_TIME=$(date -d "@$END_TIMESTAMP" +"%H:%M:%S")

# Notifica o início do timer
notify-send "⏳ Timer iniciado" "Termina às $END_TIME"

# Executa o timer em segundo plano
(
    sleep "$SECONDS"
    notify-send "⏰ Timer finalizado!" "Seu tempo de $TIME minuto(s) acabou."
    paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &>/dev/null

    rm -f "$PID_FILE" "$END_FILE"
) &

echo $! > "$PID_FILE"


