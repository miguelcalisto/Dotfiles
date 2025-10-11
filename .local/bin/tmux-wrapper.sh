#!/bin/bash

# Nome único da sessão
SESSION="auto_$$"

# Cria uma nova sessão e anexa a ela
tmux new-session -s "$SESSION" \; \
    set-option -g exit-empty on \; \
    attach

# Após sair da sessão, encerra o servidor tmux (se quiser)
tmux kill-server 2>/dev/null

