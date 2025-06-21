#!/usr/bin/env fish

set wallpaper_dir "$HOME/Imagens/Wallpapers"
set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g)$')
set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem encontrada!"
    exit 1
end

while true
    for i in (seq 1 $num)
        set selected "$wallpaper_dir/$wallpapers[$i]"
        echo "Wallpaper $i: $selected"
        gsettings set org.gnome.desktop.background picture-uri-dark "file://$selected"
        sleep 2
    end
end

