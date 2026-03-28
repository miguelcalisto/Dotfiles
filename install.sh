#!/usr/bin/env bash

sudo apt update && sudo apt install -y \
    git stow curl wget unzip build-essential pkg-config cmake \
    python3 python3-pip python3-venv pipx \
    vim tmux fish zsh \
    ripgrep fzf bat fd-find htop p7zip-full \
    nodejs npm \
    lua5.4 luarocks \
    shfmt \
    software-properties-common \
    alacritty rofi polybar picom dunst nitrogen feh \
    vlc qutebrowser neofetch vifm ranger calcurse cava lsd \
    i3 i3blocks i3status compton xbacklight scrot xss-lock i3lock xautolock \
    network-manager network-manager-gnome pulseaudio pavucontrol alsa-utils bluez bluez-tools \
    lxqt-session lxqt-panel lxqt-config pcmanfm thunar xterm terminator \
    fonts-font-awesome fonts-powerline fonts-firacode fonts-noto-color-emoji \
    xclip xdotool jq imagemagick cargo diodon

sudo apt install -y \
    neovim i3 dunst wlogout i3blocks gnome-screenshot rofi fish zsh picom \
    tmux htop btop kitty cava systemd fonts-powerline git curl wget \
    python3-pip ripgrep python3-venv fonts-firacode i3-wm i3lock psensor \
    alacritty polybar pcmanfm

sudo apt install stow --yes

pipx ensurepath
mkdir -p /usr/local/lib/node_modules

sudo chown -R $(whoami) /usr/local/lib/node_modules

sudo npm install -g \
    pyright \
    bash-language-server \
    prettier \
    tree-sitter-cli

sudo npm install -g prettier

pipx install black
pipx install isort

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
sudo chmod u+x nvim-linux-x86_64.appimage

sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

chsh -s /usr/bin/fish
mkdir ~/Imagens/Wallpapers/

nvim --headless "+Lazy sync" +qa
nvim --headless "+MasonInstall stylua bash-language-server lua-language-server beautysh pyright black shfmt" +qa
