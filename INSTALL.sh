#!/bin/bash

set -e  # Para o script se algo der errado

echo "🔧 Instalando Dotfiles..."

# 1. Instalar conteúdo de config/ em ~/.config/
CONFIG_DIR="$HOME/.config"
mkdir -p "$CONFIG_DIR"

for dir in ./config/*; do
    name=$(basename "$dir")
    target="$CONFIG_DIR/$name"

    if [ -L "$target" ] || [ -e "$target" ]; then
        echo "⚠️  Já existe: $target. Removendo..."
        rm -rf "$target"
    fi

    ln -s "$(realpath "$dir")" "$target"
    echo "✅ Linkado: $target → $dir"
done

# 2. Copiar scripts/ para ~/scripts/
SCRIPTS_DEST="$HOME/scripts"
mkdir -p "$SCRIPTS_DEST"

echo "📂 Copiando scripts para $SCRIPTS_DEST..."
cp -r ./scripts/* "$SCRIPTS_DEST"

# 3. Tornar todos os scripts executáveis (opcional)
chmod -R +x "$SCRIPTS_DEST"

echo "🎉 Instalação concluída com sucesso!"

