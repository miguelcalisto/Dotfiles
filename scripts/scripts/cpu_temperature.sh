#!/bin/bash

# Obtém as temperaturas de todos os núcleos
cpu_temps=$(sensors | grep 'Core' | awk '{print $3}' | sed 's/+//g' | sed 's/°C//g')

# Calcula a soma das temperaturas
sum=0
count=0

# Soma as temperaturas e conta os núcleos
for temp in $cpu_temps; do
    sum=$(echo "$sum + $temp" | bc)
    count=$((count + 1))
done

# Verifica se há núcleos e calcula a média
if [ "$count" -gt 0 ]; then
    # Calcula a média arredondando para o inteiro mais próximo
    cpu_temp=$(echo "scale=0; $sum / $count" | bc)
else
    cpu_temp="0"
fi

# Exibe a média das temperaturas como número inteiro
echo "  <b>CPU: ${cpu_temp}°C</b> "

