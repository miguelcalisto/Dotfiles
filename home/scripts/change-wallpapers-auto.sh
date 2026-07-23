#!/bin/bash

DIR_WALLPAPERS="$HOME/Imagens/Wallpapers"

ARQUIVO_LOG="$HOME/log.log"

shopt -s nullglob

data_atual=$(date "+%d/%m/%Y - %H:%M:%S")

if [[ ! -d "$DIR_WALLPAPERS" ]]; then
    echo "Erro no Diretório"
    exit 1
fi

wallpapers=("$DIR_WALLPAPERS"/*.{png,jpg,jpeg,webp,svg})

total_wallpapers=${#wallpapers[@]}

    if [[ "$total_wallpapers" -eq 0 ]]; then
        echo "ERRO sem Imagens"
        shopt -u nullglob
        exit 1
    fi

    dia_do_ano=$(date +%-j)
    indice=$(((dia_do_ano - 1) % total_wallpapers))

    wallpaper_escolhido="${wallpapers[$indice]}"

    echo "[$data_atual]  | Dia $dia_do_ano | Wallpaper: $wallpaper_escolhido" >>"$ARQUIVO_LOG"
    #i3wm
    feh --bg-fill "$wallpaper_escolhido" >>"$ARQUIVO_LOG" 2>&1

    shopt -u nullglob
