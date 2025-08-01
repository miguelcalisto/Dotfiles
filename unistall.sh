#!/bin/bash

# Script para desinstalar os dotfiles (remoção de links simbólicos)

echo "Removendo links simbólicos dos arquivos de configuração..."

# Arquivos da home
rm -fv ~/.bashrc
rm -fv ~/.zshrc
rm -fv ~/.tmux.conf
rm -fv ~/.vimrc
# rm -fv ~/.p10k.zsh

# Diretórios de configuração
rm -fv ~/.config/i3/config
rm -fv ~/.config/i3blocks/config
rm -fv ~/.config/rofi/config.rasi
rm -fv ~/.config/kitty/kitty.conf
rm -fv ~/.config/neofetch/config.conf
rm -fv ~/.config/htop/htoprc
rm -fv ~/.config/btop/btop.conf

# Tilix schemes
for scheme in .config/tilix/schemes/*; do
    name=$(basename "$scheme")
    rm -fv ~/.config/tilix/schemes/"$name"
done

# Scripts
for file in scripts/*; do
    name=$(basename "$file")
    rm -fv ~/scripts/"$name"
done

for file in SCRIPTS/*; do
    name=$(basename "$file")
    rm -fv ~/SCRIPTS/"$name"
done

rm -fv ~/.config/i3/powermenu.sh
rm -fv ~/.config/i3blocks/power

echo "Desinstalação concluída. Os arquivos reais permanecem no seu repositório."

