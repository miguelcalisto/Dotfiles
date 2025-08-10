#!/bin/bash

# Script para instalar os dotfiles no Debian

set -e  # Encerra em caso de erro

echo "🔧 Atualizando o sistema e instalando dependências..."
sudo apt update && sudo apt upgrade -y

# Pacotes essenciais
echo "📦 Instalando pacotes essenciais..."
sudo apt install -y \
    neovim i3 dunst wlogout i3blocks gnome-screenshot rofi fish zsh picom \
    tmux htop btop kitty cava systemd fonts-powerline git curl wget \
    python3-pip ripgrep python3-venv fonts-firacode i3-wm i3lock psensor \
    alacritty

# Criar diretórios de configuração
echo "📁 Criando diretórios de configuração..."
mkdir -p ~/.config/{i3,i3blocks,rofi,kitty,neofetch,htop,btop,picom,dunst,wlogout,tilix/schemes,systemd/user}
mkdir -p ~/scripts ~/SCRIPTS

# Linkar arquivos de configuração da home
echo "🔗 Linkando arquivos da home..."
for file in .bashrc .zshrc .tmux.conf .vimrc; do
    ln -sf "$(pwd)/$file" ~/"$file"
done
# ln -sf "$(pwd)/.p10k.zsh" ~/.p10k.zsh  # Descomentável se necessário

# Linkar arquivos do .config
echo "🔗 Linkando arquivos do .config..."
ln -sf "$(pwd)/.config/i3/config" ~/.config/i3/config
ln -sf "$(pwd)/.config/i3blocks/config" ~/.config/i3blocks/config
ln -sf "$(pwd)/.config/i3blocks/power" ~/.config/i3blocks/power
ln -sf "$(pwd)/.config/i3/powermenu.sh" ~/.config/i3/powermenu.sh
ln -sf "$(pwd)/.config/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$(pwd)/.config/kitty/kitty.conf" ~/.config/kitty/kitty.conf
ln -sf "$(pwd)/.config/neofetch/config.conf" ~/.config/neofetch/config.conf
ln -sf "$(pwd)/.config/htop/htoprc" ~/.config/htop/htoprc
ln -sf "$(pwd)/.config/btop/btop.conf" ~/.config/btop/btop.conf
ln -sf "$(pwd)/.config/picom/picom.conf" ~/.config/picom/picom.conf
ln -sf "$(pwd)/.config/dunst/dunstrc" ~/.config/dunst/dunstrc
ln -sf "$(pwd)/.config/wlogout/layout" ~/.config/wlogout/layout
ln -sf "$(pwd)/.config/wlogout/style.css" ~/.config/wlogout/style.css

# Tilix schemes
echo "🎨 Linkando esquemas do Tilix..."
for scheme in .config/tilix/schemes/*; do
    ln -sf "$(pwd)/$scheme" ~/.config/tilix/schemes/$(basename "$scheme")
done

# Linkar scripts
echo "🔗 Linkando scripts..."
for script in scripts/*; do
    ln -sf "$(pwd)/$script" ~/scripts/$(basename "$script")
done

for script in SCRIPTS/*; do
    ln -sf "$(pwd)/$script" ~/SCRIPTS/$(basename "$script")
done


# Neovim
echo "🔗 Linkando configurações do Neovim..."
mkdir -p ~/.config/nvim/lua/user

ln -sf "$(pwd)/.config/nvim/init.lua" ~/.config/nvim/init.lua
ln -sf "$(pwd)/.config/nvim/lazy-lock.json" ~/.config/nvim/lazy-lock.json

for file in $(pwd)/.config/nvim/lua/user/*; do
    ln -sf "$file" ~/.config/nvim/lua/user/$(basename "$file")
done

# Temas do btop (com estrutura themes/themes/)
echo "🎨 Linkando temas do btop..."
mkdir -p ~/.config/btop/themes

for theme in .config/btop/themes/themes/*.theme; do
    ln -sf "$(pwd)/$theme" ~/.config/btop/themes/$(basename "$theme")
done


# Polybar
echo "🔗 Linkando configurações do Polybar..."
mkdir -p ~/.config/polybar

ln -sf "$(pwd)/.config/polybar/config.ini" ~/.config/polybar/config.ini
ln -sf "$(pwd)/.config/polybar/launch.sh" ~/.config/polybar/launch.sh

mkdir -p ~/.config/polybar/scripts
for script in .config/polybar/scripts/*; do
    ln -sf "$(pwd)/$script" ~/.config/polybar/scripts/$(basename "$script")
done

# Alacritty
mkdir -p ~/.config/alacritty

echo "🔗 Linkando configurações do Alacritty..."
ln -sf "$(pwd)/.config/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
ln -sf "$(pwd)/.config/alacritty/dracula.toml" ~/.config/alacritty/dracula.toml

# Final
echo "✅ Instalação concluída! Reinicie sua sessão para aplicar as mudanças."

