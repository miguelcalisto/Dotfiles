#!/usr/bin/env fish

set wallpaper_dir "$HOME/Imagens/Wallpapers"
set wallpapers (ls -1S $wallpaper_dir | grep -iE '\.(png|jpe?g)$')
set num (count $wallpapers)

if test $num -eq 0
    echo "Nenhuma imagem encontrada!"
    exit 1
end

# Verifica se existe um arquivo com o índice da última imagem exibida
if test -f "$HOME/.last_wallpaper_index"
    set index (cat $HOME/.last_wallpaper_index)
else
    # Começa do primeiro wallpaper se não houver arquivo
    set index 1
end

while true
    set selected "$wallpaper_dir/$wallpapers[$index]"
    echo "Usando wallpaper $index: $selected"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$selected"
    
    # Salva o índice atual para continuar na próxima execução
    echo $index > $HOME/.last_wallpaper_index

    # Aguarda 3 segundos
    sleep 7

    # Incrementa o índice para a próxima imagem
    set index (math "$index + 1")
    if test $index -gt $num
        set index 1  # Se passar do número de imagens, reinicia
    end
end

