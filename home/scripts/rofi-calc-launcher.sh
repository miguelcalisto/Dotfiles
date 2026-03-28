#!/bin/bash
#x-terminal-emulator -T "Calculadora Terminal" -e qalc
alacritty \
  --config-file ~/.config/alacritty/solid.yml \
  -t "Calculadora Terminal" \
  -e qalc
