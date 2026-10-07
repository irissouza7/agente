#!/bin/bash

TARGET="$HOME/.claude"
BACKUP="$TARGET/backups/$(date +%Y-%m-%dT%H-%M-%S)"

if [[ "$1" == "--uninstall" ]]; then
  echo "[uninstall] restaurando settings.json do backup"
  cp "$TARGET/backups/latest/settings.json" "$TARGET/settings.json"
  exit 0
fi

mkdir -p "$TARGET/backups"
if [[ -f "$TARGET/settings.json" ]]; then
  cp "$TARGET/settings.json" "$BACKUP-settings.json"
  ln -sf "$BACKUP-settings.json" "$TARGET/backups/latest/settings.json"
  echo "[install] backup em $BACKUP"
else
  echo "[install] nada a salvar: nenhum arquivo sera alterado, backup nao criado"
fi

# Copiar instruções globais, skills e hooks
cp CLAUDE.md "$TARGET/"
cp -r skills "$TARGET/"
cp -r hooks "$TARGET/"
echo "... arquivos instalados"
