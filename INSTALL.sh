#!/bin/bash

set -e

echo "🔧 Instalando Dotfiles..."

# 1. Linkar conteúdo de config/ para ~/.config/
CONFIG_SRC="./config"
CONFIG_DEST="$HOME/.config"

mkdir -p "$CONFIG_DEST"

echo "🔗 Linkando diretórios de $CONFIG_SRC para $CONFIG_DEST..."

for item in "$CONFIG_SRC"/*; do
    name=$(basename "$item")
    target="$CONFIG_DEST/$name"

    # Ignorar arquivos .bak ou temporários
    [[ "$name" == *.bak ]] && continue

    if [ -L "$target" ] || [ -e "$target" ]; then
        echo "⚠️  Removendo existente: $target"
        rm -rf "$target"
    fi

    ln -s "$(realpath "$item")" "$target"
    echo "✅ Link criado: $target"
done

# 2. Copiar scripts/ para ~/scripts/
SCRIPTS_SRC="./scripts"
SCRIPTS_DEST="$HOME/scripts"

mkdir -p "$SCRIPTS_DEST"

echo "📂 Copiando scripts de $SCRIPTS_SRC para $SCRIPTS_DEST..."

cp -r "$SCRIPTS_SRC"/* "$SCRIPTS_DEST"

# Tornar todos os scripts executáveis
echo "🔐 Tornando scripts executáveis..."
find "$SCRIPTS_DEST" -type f -iname "*.sh" -exec chmod +x {} \;
find "$SCRIPTS_DEST" -type f -iname "*.fish" -exec chmod +x {} \;

echo "✅ Instalação concluída com sucesso!"
