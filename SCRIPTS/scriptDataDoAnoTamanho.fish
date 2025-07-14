#!/usr/bin/env fish

set wallpaper_dir "$HOME/Imagens/Wallpapers"
set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g)$')  # Ordena por tamanho
set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem válida encontrada em $wallpaper_dir" >> /home/debian/SCRIPTS/LOGS/logs_scriptDataDoAnoTamanho.log
    exit 1
end

# Dia do ano (1 a 365/366)
set day_of_year (date +%j)

# Índice para seguir a sequência das imagens (vai reiniciar após a última imagem)
set index (math "($day_of_year - 1) % $num + 1")
set selected "$wallpaper_dir/$wallpapers[$index]"

echo "Mudando para o wallpaper do dia $day_of_year: $selected" >> /home/debian/SCRIPTS/LOGS/logs_scriptDataDoAnoTamanho.log

# Muda o wallpaper para o escolhido
gsettings set org.gnome.desktop.background picture-uri-dark "file://$selected" >> /home/debian/SCRIPTS/LOGS/logs_scriptDataDoAnoTamanho.log 2>&1

