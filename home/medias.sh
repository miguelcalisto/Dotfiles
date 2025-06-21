#!/bin/bash

# Contagem total de linhas no arquivo
total=$(wc -l < temperaturas_cpu.txt)

# Função para calcular a porcentagem
calcular_porcentagem() {
    echo "scale=2; ($1 / $total) * 100" | bc
}

# FAIXAS DE TEMPERATURA
declare -A faixas

faixas["ENTRE 90 E 100"]=$(awk '$1 > 90 && $1 <= 100' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 85 E 90"]=$(awk '$1 > 85 && $1 <= 90' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 80 E 85"]=$(awk '$1 > 80 && $1 <= 85' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 75 E 80"]=$(awk '$1 > 75 && $1 <= 80' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 70 E 75"]=$(awk '$1 > 70 && $1 <= 75' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 65 E 70"]=$(awk '$1 > 65 && $1 <= 70' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 60 E 65"]=$(awk '$1 > 60 && $1 <= 65' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 55 E 60"]=$(awk '$1 > 55 && $1 <= 60' temperaturas_cpu.txt | wc -l)
faixas["ENTRE 50 E 55"]=$(awk '$1 > 50 && $1 <= 55' temperaturas_cpu.txt | wc -l)
faixas["MENOR QUE 50"]=$(awk '$1 <= 50' temperaturas_cpu.txt | wc -l)

# Função para exibir faixas e porcentagens
mostrar_faixa() {
    faixa=$1
    quantidade=${faixas[$faixa]}
    porcentagem=$(calcular_porcentagem $quantidade)
    
    echo "$faixa: $quantidade"
    echo "Porcentagem: $porcentagem%"
    echo "------------------------------"
}

# Exibindo as faixas com a porcentagem
mostrar_faixa "ENTRE 90 E 100"
mostrar_faixa "ENTRE 85 E 90"
mostrar_faixa "ENTRE 80 E 85"
mostrar_faixa "ENTRE 75 E 80"
mostrar_faixa "ENTRE 70 E 75"
mostrar_faixa "ENTRE 65 E 70"
mostrar_faixa "ENTRE 60 E 65"
mostrar_faixa "ENTRE 55 E 60"
mostrar_faixa "ENTRE 50 E 55"
mostrar_faixa "MENOR QUE 50"

# TOTAL
echo "TOTAL: $total"

