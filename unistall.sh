#!/bin/bash

echo "Removendo links simbólicos dos arquivos de configuração..."

# Função para remover link simbólico se existir e for link
remove_link() {
    local target="$1"
    if [ -L "$target" ]; then
        unlink "$target"
        echo "Removido link: $target"
    else
        echo "Não é link simbólico ou não existe: $target"
    fi
}

# Arquivos da home
remove_link ~/.bashrc
remove_link ~/.zshrc
remove_link ~/.tmux.conf
remove_link ~/.vimrc
# remove_link ~/.p10k.zsh

# Diretórios de configuração
remove_link ~/.config/i3/config
remove_link ~/.config/i3blocks/config
remove_link ~/.config/i3blocks/power
remove_link ~/.config/i3/powermenu.sh
remove_link ~/.config/rofi/config.rasi
remove_link ~/.config/kitty/kitty.conf
remove_link ~/.config/neofetch/config.conf
remove_link ~/.config/htop/htoprc
remove_link ~/.config/btop/btop.conf
remove_link ~/.config/picom/picom.conf
remove_link ~/.config/dunst/dunstrc
remove_link ~/.config/wlogout/layout
remove_link ~/.config/wlogout/style.css

# Tilix schemes
for scheme in ~/.config/tilix/schemes/*; do
    if [ -L "$scheme" ]; then
        unlink "$scheme"
        echo "Removido link: $scheme"
    fi
done

# Scripts
for file in ~/scripts/*; do
    if [ -L "$file" ]; then
        unlink "$file"
        echo "Removido link: $file"
    fi
done

for file in ~/SCRIPTS/*; do
    if [ -L "$file" ]; then
        unlink "$file"
        echo "Removido link: $file"
    fi
done

# Polybar
remove_link ~/.config/polybar/config.ini
remove_link ~/.config/polybar/launch.sh

for file in ~/.config/polybar/scripts/*; do
    if [ -L "$file" ]; then
        unlink "$file"
        echo "Removido link: $file"
    fi
done

# Alacritty
remove_link ~/.config/alacritty/alacritty.yml
remove_link ~/.config/alacritty/dracula.toml


echo "✅ Desinstalação concluída!"

