#!/bin/bash

echo "Removendo links simbólicos dos arquivos de configuração..."

# Arquivos da home
unlink ~/.bashrc 2>/dev/null
unlink ~/.zshrc 2>/dev/null
unlink ~/.tmux.conf 2>/dev/null
unlink ~/.vimrc 2>/dev/null
# unlink ~/.p10k.zsh 2>/dev/null

# Diretórios de configuração
unlink ~/.config/i3/config 2>/dev/null
unlink ~/.config/i3blocks/config 2>/dev/null
unlink ~/.config/rofi/config.rasi 2>/dev/null
unlink ~/.config/kitty/kitty.conf 2>/dev/null
unlink ~/.config/neofetch/config.conf 2>/dev/null
unlink ~/.config/htop/htoprc 2>/dev/null
unlink ~/.config/btop/btop.conf 2>/dev/null

# Tilix schemes
for scheme in ~/.config/tilix/schemes/*; do
    unlink "$scheme" 2>/dev/null
done

# Scripts
for file in ~/scripts/*; do
    unlink "$file" 2>/dev/null
done

for file in ~/SCRIPTS/*; do
    unlink "$file" 2>/dev/null
done

unlink ~/.config/i3/powermenu.sh 2>/dev/null
unlink ~/.config/i3blocks/power 2>/dev/null
unlink ~/.config/dunst/dunstrc 2>/dev/null

echo "Desinstalação concluída. Os arquivos reais permanecem no seu repositório."

