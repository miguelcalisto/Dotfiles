#!/bin/bash
HORA=$(date '+%H:%M')
DATA=$(date '+━ %d-%m-%Y')
DIA=$(date '+%a' | tr 'a-z' 'A-Z')  # Converte o dia para maiúsculas

# Exibir o dia da semana em lavanda e a hora com a cor original
echo " <span color='#edb3f2' font_weight='bold'>$DIA</span> <span color='#F1FA8C' font_weight='bold' size='12000'>$HORA</span> $DATA "

echo "#FFFFFF"

