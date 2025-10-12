#!/bin/bash


chosen=$(echo -e "  Bloquear\n⏻  Desligar\n  Reiniciar\n  Suspender\n󰍃  Encerrar Sessão\n  Cancelar" | rofi -dmenu -i -p "⚡ Power Menu")

case "$chosen" in
    "  Bloquear") i3lock -c 000000 ;;
    "⏻  Desligar") systemctl poweroff ;;
    "  Reiniciar") systemctl reboot ;;
    "  Suspender") systemctl suspend ;;
    "󰍃  Encerrar Sessão") i3-msg exit ;;
    *) exit 0 ;;
esac


