#!/bin/bash

# Verificar se há atualizações disponíveis no Debian (apt)
updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)

# Se houver atualizações, mostrar número de atualizações
if [ "$updates" -gt 0 ]; then
    echo " $updates"  # ícone de atualizações (usando Font Awesome ou outros ícones)
else
    echo ""  # ícone de check (sem atualizações)
fi

