#!/usr/bin/env fish

set wallpaper_dir "$HOME/Imagens/Wallpapers"

set wallpapers (ls -1 $wallpaper_dir | grep -iE '\.(png|jpe?g)$' | sort)

set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem válida encontrada em $wallpaper_dir" >> /home/debian/SCRIPTS/LOGS/logs_scriptOrdemAlfabetica2.log 2>&1
    exit 1
end

set day_of_year (date +%j)

set index (math "($day_of_year - 1) % $num + 1")

set selected "$wallpaper_dir/$wallpapers[$index]"

echo "Usando wallpaper do dia $day_of_year: $selected" >> /home/debian/SCRIPTS/LOGS/logs_scriptOrdemAlfabetica2.log 2>&1

gsettings set org.gnome.desktop.background picture-uri-dark "file://$selected" >> /home/debian/SCRIPTS/LOGS/logs_scriptOrdemAlfabetica2.log 2>&1

