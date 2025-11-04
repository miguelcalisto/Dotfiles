#!/usr/bin/env fish


set wallpaper_dir "$HOME/Imagens/Wallpapers"
#set wallpaper_dir "$HOME/Imagens/bestsWallpapers"
#set wallpaper_dir "$HOME/Imagens/bestsWallpapers"
#set wallpaper_dir "$HOME/Imagens/Wallpapers"
#não pega webp
#set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g)$')  # Ordena por tamanho

#estava funcianando o de baixo
#set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g|webp)$')  # Agora inclui .webp
set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g|webp|svg)$')

set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem válida encontrada em $wallpaper_dir" >> /home/debian/SCRIPTS/LOGS/log.log
    exit 1
end

# Dia do ano (1 a 365/366)
set day_of_year (date +%j)

# Índice da imagem com base no dia do ano
set index (math "($day_of_year - 1) % $num + 1")
set selected "$wallpaper_dir/$wallpapers[$index]"

#set current_datetime (date "+%Y-%m-%d %H:%M:%S")
set current_datetime (date "+%d/%m/%Y - %H:%M:%S")

echo "Mudando para o wallpaper do dia $day_of_year: $selected na data: $current_datetime" >> /home/debian/SCRIPTS/LOGS/log.log

# Aplica o wallpaper com feh (compatível com i3)
#feh --bg-scale $selected >> /home/debian/SCRIPTS/LOGS/log.log 2>&1

feh --bg-scale "$selected" >> /home/debian/SCRIPTS/LOGS/log.log 2>&1


