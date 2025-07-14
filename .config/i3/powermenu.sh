#!/bin/bash

chosen=$(echo -e "⏻  Desligar\n  Reiniciar\n  Suspender\n  Hibernar\n󰍃  Encerrar Sessão\n  Cancelar" | rofi -dmenu -i -p "⚡ Power Menu")

case "$chosen" in
    "⏻  Desligar") systemctl poweroff ;;
    "  Reiniciar") systemctl reboot ;;
    "  Suspender") systemctl suspend ;;
    "  Hibernar") systemctl hibernate ;;
    "󰍃  Encerrar Sessão") i3-msg exit ;;
    *) exit 0 ;;
esac

