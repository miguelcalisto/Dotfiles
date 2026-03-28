#!/usr/bin/env bash

echo 'export PATH="$PATH:/opt/nvim/"' >>~/.bashrc

echo 'export PATH="$PATH:/opt/nvim/"' >>~/.zshrc

echo 'set -gx PATH $PATH /opt/nvim/' >>~/.config/fish/config.fish

fc-cache -fv
systemctl --user enable --now \
    calcurse-avisar.service \
    calcurse-avisar.timer \
    calcurse-aviso.service \
    calcurse-aviso.timer \
    calcurse-notify.service \
    wall.service \
    wall.timer
systemctl --user daemon-reload
