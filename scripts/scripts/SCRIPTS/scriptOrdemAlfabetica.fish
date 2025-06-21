#!/usr/bin/env fish

set wallpaper_dir "$HOME/Imagens/Wallpapers"

# Pega apenas arquivos .jpg, .jpeg e .png ordenados por nome
set wallpapers (ls -1 $wallpaper_dir | grep -iE '\.(png|jpe?g)$' | sort)

set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem válida encontrada em $wallpaper_dir" >> $HOME/SCRIPTS/LOGS/logs_scriptOrdemAlfabetica.log 2>&1
    exit 1
end

# Dia do ano (1 a 365/366)
set day_of_year (date +%j)

# Índice para seguir a sequência das imagens (vai reiniciar após a última imagem)
set index (math "($day_of_year - 1) % $num + 1")

# Caminho da imagem escolhida
set selected "$wallpaper_dir/$wallpapers[$index]"

echo "Usando wallpaper do dia $day_of_year: $selected" >> $HOME/SCRIPTS/LOGS/logs_scriptOrdemAlfabetica.log 2>&1

# Define para o tema escuro (pode duplicar para o tema claro se quiser)
gsettings set org.gnome.desktop.background picture-uri-dark "file://$selected" >> $HOME/SCRIPTS/LOGS/logs_scriptOrdemAlfabetica.log 2>&1

