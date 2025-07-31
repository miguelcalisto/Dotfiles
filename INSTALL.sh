#!/bin/bash

# Script para instalar os dotfiles no Debian

# Atualizar e instalar pacotes necessários
echo "Atualizando o sistema e instalando dependências..."
sudo apt update && sudo apt upgrade -y

# Instalar pacotes essenciais
sudo apt install -y \
    neovim \
    i3 \
    i3blocks \
    rofi \
    zsh \
    fish \
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
    fonts-firacode

# Clonar o repositório de temas para o Fish
echo "Clonando o repositório de plugins e temas do Fish..."
git clone https://github.com/jorgebucaran/fisher.git ~/.config/fish/functions

# Instalar os plugins do Fish
echo "Instalando plugins do Fish..."
fish -c "fisher install"

# Sincronizar o diretório de configuração
echo "Copiando os arquivos de configuração..."

# Copiar os arquivos de configuração para o diretório correto
cp -r .config/* ~/.config/

# Copiar o arquivo .bashrc
cp .bashrc ~/

# Copiar o arquivo .zshrc
cp .zshrc ~/

# Copiar o arquivo .tmux.conf
cp .tmux.conf ~/

# Copiar o arquivo .vimrc
cp .vimrc ~/

# Copiar o arquivo .p10k.zsh
cp .p10k.zsh ~/

# Copiar o arquivo de Neovim (init.lua ou init.vim)
cp .config/nvim/init.lua ~/.config/nvim/

# Copiar o arquivo de configuração do i3
cp .config/i3/config ~/.config/i3/

# Copiar o arquivo de configuração do i3blocks
cp .config/i3blocks/config ~/.config/i3blocks/

# Copiar o arquivo de configuração do rofi
cp .config/rofi/config.rasi ~/.config/rofi/

# Copiar o arquivo de configuração do kitty
cp .config/kitty/kitty.conf ~/.config/kitty/

# Copiar o arquivo de configuração do neofetch
cp .config/neofetch/config.conf ~/.config/neofetch/

# Copiar o arquivo de configuração do htop
cp .config/htop/htoprc ~/.config/htop/

# Copiar o arquivo de configuração do btop
cp .config/btop/btop.conf ~/.config/btop/

# Copiar o arquivo de configuração do cava
cp .config/cava/cava ~/.config/cava/

# Copiar o arquivo de configuração do tilix
cp .config/tilix/schemes/* ~/.config/tilix/schemes/

# Copiar os arquivos de systemd
cp .config/systemd/user/* ~/.config/systemd/user/

# Configurar o Neovim (instalar pacotes e configurações)
echo "Configurando o Neovim..."
nvim +PlugInstall +qall

# Instalar a fonte FiraCode (para Zsh e outras configurações)
echo "Instalando a fonte FiraCode..."
sudo apt install -y fonts-firacode

echo "Instalando o Zsh e definindo como shell padrão..."
chsh -s $(which zsh)

# Finalizar
echo "Instalação concluída! Reinicie sua sessão para aplicar as mudanças."

