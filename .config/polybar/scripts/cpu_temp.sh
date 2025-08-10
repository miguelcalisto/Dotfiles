#!/bin/bash

# Para Linux: lê a temperatura do sensor (ajuste o caminho se necessário)
# Exemplo comum em sistemas com lm-sensors instalado:
temp=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)

if [ -z "$temp" ]; then
    echo "N/A"
else
    # converte miligrade para grau C (ex: 42000 -> 42)
    echo "$((temp / 1000))°C"
fi

