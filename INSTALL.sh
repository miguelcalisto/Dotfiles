#!/bin/bash

# Script para instalar os dotfiles no Debian

# Atualizar e instalar pacotes necessários
echo "Atualizando o sistema e instalando dependências..."
sudo apt update && sudo apt upgrade -y

# Instalar pacotes essenciais
sudo apt install -y \
    neovim \
    i3 \
    dunst \
    wlogout \
    i3blocks \
    gnome-screenshot \
    rofi \
    fish \
    zsh \
    picom \
    tmux \
    htop \
    btop \
    kitty \
    cava \
    systemd \
    fonts-powerline \
    git \
    curl \
    wget \
    python3-pip \
    python3-venv \
    fonts-firacode \
    i3-wm \
    i3lock

# Criar diretórios de configuração se não existirem
mkdir -p ~/.config/{i3,i3blocks,rofi,kitty,neofetch,htop,btop,tilix/schemes,systemd/user}
mkdir -p ~/scripts ~/SCRIPTS

# Linkar arquivos de configuração da home
echo "Criando links simbólicos para arquivos da home..."
ln -sf "$(pwd)/.bashrc" ~/.bashrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/.vimrc" ~/.vimrc
# ln -sf "$(pwd)/.p10k.zsh" ~/.p10k.zsh

# Linkar arquivos do .config
echo "Criando links simbólicos para arquivos do .config..."

ln -sf "$(pwd)/.config/i3/config" ~/.config/i3/config
ln -sf "$(pwd)/.config/i3blocks/config" ~/.config/i3blocks/config
ln -sf "$(pwd)/.config/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$(pwd)/.config/kitty/kitty.conf" ~/.config/kitty/kitty.conf
ln -sf "$(pwd)/.config/neofetch/config.conf" ~/.config/neofetch/config.conf
ln -sf "$(pwd)/.config/htop/htoprc" ~/.config/htop/htoprc
ln -sf "$(pwd)/.config/btop/btop.conf" ~/.config/btop/btop.conf

# Tilix (loop para múltiplos esquemas)
for scheme in .config/tilix/schemes/*; do
    ln -sf "$(pwd)/$scheme" ~/.config/tilix/schemes/
done


# Linkar scripts
mkdir -p ~/scripts ~/SCRIPTS
ln -sf $(pwd)/scripts/* ~/scripts/
ln -sf $(pwd)/SCRIPTS/* ~/SCRIPTS/

# Arquivos extras do i3 e i3blocks
ln -sf "$(pwd)/.config/i3/powermenu.sh" ~/.config/i3/powermenu.sh
ln -sf "$(pwd)/.config/i3blocks/power" ~/.config/i3blocks/power

# Instalar a fonte FiraCode (caso ainda não esteja instalada)
echo "Instalando a fonte FiraCode..."
sudo apt install -y fonts-firacode

# Definir o Zsh como shell padrão (opcional)
# echo "Definindo o Zsh como shell padrão..."
# chsh -s $(which zsh)

# Criar diretório do picom se não existir
mkdir -p ~/.config/picom

# Linkar configuração do picom
ln -sf "$(pwd)/.config/picom/picom.conf" ~/.config/picom/picom.conf

# Linkar a configuração do dunst
mkdir -p ~/.config/dunst
ln -sf "$(pwd)/.config/dunst/dunstrc" ~/.config/dunst/dunstrc

# Criar diretório para o wlogout, caso não exista
mkdir -p ~/.config/wlogout
ln -sf "$(pwd)/.config/wlogout/layout" ~/.config/wlogout/layout
ln -sf "$(pwd)/.config/wlogout/style.css" ~/.config/wlogout/style.css

echo "Configuração do wlogout aplicada!"


# Finalizar
echo "Instalação concluída! Reinicie sua sessão para aplicar as mudanças."

