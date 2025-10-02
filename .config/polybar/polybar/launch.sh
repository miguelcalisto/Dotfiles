#!/bin/bash

# Fecha instâncias antigas
killall -q polybar

# Espera até que elas realmente morram
while pgrep -x polybar >/dev/null; do sleep 1; done

# Inicia a Polybar
polybar example &

echo "Polybar iniciada..."
