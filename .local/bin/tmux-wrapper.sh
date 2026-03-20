#!/bin/bash

SESSION="auto_$$"

tmux new-session -s "$SESSION" \; \
    set-option -g exit-empty on \; \
    attach

tmux kill-server 2>/dev/null
