#!/bin/bash

# Script para desinstalar pacotes e remover configurações

# Remover pacotes instalados
echo "Removendo pacotes instalados..."
sudo apt remove --purge -y \
    neovim \
    i3 \
    i3blocks \
    rofi \
    fish \
    zsh \
    tmux \
    htop \
    btop \
    kitty \
    cava \

# Remover pacotes que não são mais necessários
echo "Removendo pacotes desnecessários..."
sudo apt autoremove --purge -y

# Excluir arquivos de configuração
echo "Removendo arquivos de configuração..."
rm -rf ~/.config/nvim
rm -rf ~/.config/i3
rm -rf ~/.config/i3blocks
rm -rf ~/.config/rofi
rm -rf ~/.config/kitty
rm -rf ~/.config/neofetch
rm -rf ~/.config/htop
rm -rf ~/.config/btop
rm -rf ~/.config/cava
rm -rf ~/.config/tilix
rm -rf ~/.config/fish
rm -rf ~/.config/fish/functions/fisher

# Excluir arquivos do usuário
echo "Removendo arquivos de configuração do usuário..."
rm -f ~/.zshrc
rm -f ~/.tmux.conf
rm -f ~/.vimrc
rm -f ~/.p10k.zsh
rm -f ~/.gitconfig

# Remover fontes
echo "Removendo a fonte FiraCode..."
sudo apt remove --purge -y fonts-firacode

# Restaurar o shell padrão (bash)
echo "Restaurando o shell padrão..."
chsh -s $(which bash)

# Finalizar
echo "Desinstalação concluída! Você pode precisar reiniciar para aplicar as mudanças."

