#!/bin/bash

COR_DIA='#edb3f2'
COR_HORA='#F1FA8C'

HORA=$(date '+%H:%M')
DATA=$(date '+━ %d-%m-%Y')

DIA=$(date '+%a' | iconv -f utf-8 -t ascii//TRANSLIT | tr 'a-z' 'A-Z')

echo " <span color='$COR_DIA' font_weight='bold'>$DIA</span> <span color='$COR_HORA' font_weight='bold' size='12000'>$HORA</span> $DATA"
