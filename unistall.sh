#!/bin/bash

# Script para desinstalar os dotfiles (remoção de links simbólicos)

echo "Removendo links simbólicos dos arquivos de configuração..."

# Arquivos da home
if [ -L ~/.bashrc ]; then unlink ~/.bashrc; fi
if [ -L ~/.zshrc ]; then unlink ~/.zshrc; fi
if [ -L ~/.tmux.conf ]; then unlink ~/.tmux.conf; fi
if [ -L ~/.vimrc ]; then unlink ~/.vimrc; fi
# if [ -L ~/.p10k.zsh ]; then unlink ~/.p10k.zsh; fi

# Diretórios de configuração
if [ -L ~/.config/i3/config ]; then unlink ~/.config/i3/config; fi
if [ -L ~/.config/i3blocks/config ]; then unlink ~/.config/i3blocks/config; fi
if [ -L ~/.config/rofi/config.rasi ]; then unlink ~/.config/rofi/config.rasi; fi
if [ -L ~/.config/kitty/kitty.conf ]; then unlink ~/.config/kitty/kitty.conf; fi
if [ -L ~/.config/neofetch/config.conf ]; then unlink ~/.config/neofetch/config.conf; fi
if [ -L ~/.config/htop/htoprc ]; then unlink ~/.config/htop/htoprc; fi
if [ -L ~/.config/btop/btop.conf ]; then unlink ~/.config/btop/btop.conf; fi

# Tilix schemes
for scheme in ~/.config/tilix/schemes/*; do
    if [ -L "$scheme" ]; then
        unlink "$scheme"
    fi
done

# Scripts
for file in ~/scripts/*; do
    if [ -L "$file" ]; then
        unlink "$file"
    fi
done

for file in ~/SCRIPTS/*; do
    if [ -L "$file" ]; then
        unlink "$file"
    fi
done

if [ -L ~/.config/i3/powermenu.sh ]; then unlink ~/.config/i3/powermenu.sh; fi
if [ -L ~/.config/i3blocks/power ]; then unlink ~/.config/i3blocks/power; fi
if [ -L ~/.config/dunst/dunstrc ]; then unlink ~/.config/dunst/dunstrc; fi

echo "Desinstalação concluída. Os arquivos reais permanecem no seu repositório."

