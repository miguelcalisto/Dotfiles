#!/bin/bash

# === Cores ===
COR_DIA='#edb3f2'       # Lavanda (para o dia da semana)
COR_HORA='#F1FA8C'      # Amarelo (para a hora)

# === Data e hora ===
HORA=$(date '+%H:%M')
DATA=$(date '+━ %d-%m-%Y')

# Dia da semana sem acento e em maiúsculas
DIA=$(date '+%a' | iconv -f utf-8 -t ascii//TRANSLIT | tr 'a-z' 'A-Z')

# === Saída formatada ===
echo " <span color='$COR_DIA' font_weight='bold'>$DIA</span> <span color='$COR_HORA' font_weight='bold' size='12000'>$HORA</span> $DATA"


