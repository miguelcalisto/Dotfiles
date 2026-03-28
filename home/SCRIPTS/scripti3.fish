#!/usr/bin/env fish



set wallpaper_dir "$HOME/Imagens/Wallpapers"
#set wallpaper_dir "$HOME/Imagens/bestsWallpapers"
#set wallpaper_dir "$HOME/Imagens/bestsWallpapers"
#set wallpaper_dir "$HOME/Imagens/Wallpapers"
#set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g)$')  

#set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g|webp)$')  
set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g|webp|svg)$')

set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem válida encontrada em $wallpaper_dir" >> /home/debian/SCRIPTS/LOGS/log.log
    exit 1
end

set day_of_year (date +%j)

set index (math "($day_of_year - 1) % $num + 1")
set selected "$wallpaper_dir/$wallpapers[$index]"
set current_datetime (date "+%d/%m/%Y - %H:%M:%S")

echo "Mudando para o wallpaper do dia $day_of_year: $selected na data: $current_datetime" >> /home/debian/SCRIPTS/LOGS/log.log

#feh --bg-scale $selected >> /home/debian/SCRIPTS/LOGS/log.log 2>&1

feh --bg-scale "$selected" >> /home/debian/SCRIPTS/LOGS/log.log 2>&1
feh --bg-fill "$selected" 



