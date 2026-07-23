#!/usr/bin/env bash
sudo -v
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
    xclip xdotool jq imagemagick cargo diodon git-lfs \
    i3 dunst wlogout i3blocks gnome-screenshot rofi fish zsh picom \
    tmux htop btop kitty cava systemd fonts-powerline git curl wget \
    python3-pip ripgrep python3-venv fonts-firacode i3-wm i3lock psensor \
    alacritty polybar pcmanfm stow

chsh -s /usr/bin/fish

mkdir -p ~/Imagens/Wallpapers/

stow */

fc-cache -fv

systemctl --user daemon-reload

systemctl --user enable --now \
    wall.service \
    wall.timer
