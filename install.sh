#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
STATE_FILE="$TARGET/.agente-install-state"
MANAGED_FILES=(
  "CLAUDE.md"
  "skills/minha-skill/SKILL.md"
  "hooks/pretool-hook.sh"
  "hooks/posttool-hook.sh"
)

if [[ "${1:-}" == "--uninstall" ]]; then
  if [[ ! -f "$STATE_FILE" ]]; then
    echo "[uninstall] estado de instalação não encontrado em $STATE_FILE" >&2
    exit 1
  fi

  IFS= read -r BACKUP_NAME < "$STATE_FILE"
  BACKUP_DIR="$TARGET/backups/$BACKUP_NAME"
  if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "[uninstall] backup não encontrado: $BACKUP_DIR" >&2
    exit 1
  fi

  for relative_path in "${MANAGED_FILES[@]}"; do
    rm -f -- "$TARGET/$relative_path"
    if [[ -f "$BACKUP_DIR/$relative_path" ]]; then
      mkdir -p -- "$(dirname -- "$TARGET/$relative_path")"
      cp -- "$BACKUP_DIR/$relative_path" "$TARGET/$relative_path"
    fi
  done
  rm -f -- "$STATE_FILE"
  echo "[uninstall] artefatos removidos e arquivos anteriores restaurados"
  exit 0
fi

if [[ $# -gt 0 ]]; then
  echo "Uso: $0 [--uninstall]" >&2
  exit 2
fi

mkdir -p -- "$TARGET/backups"
if [[ ! -f "$STATE_FILE" ]]; then
  BACKUP_NAME="agente-$(date +%Y-%m-%dT%H-%M-%S)"
  BACKUP_DIR="$TARGET/backups/$BACKUP_NAME"
  mkdir -p -- "$BACKUP_DIR"
  for relative_path in "${MANAGED_FILES[@]}"; do
    if [[ -f "$TARGET/$relative_path" ]]; then
      mkdir -p -- "$(dirname -- "$BACKUP_DIR/$relative_path")"
      cp -- "$TARGET/$relative_path" "$BACKUP_DIR/$relative_path"
    fi
  done
  printf '%s\n' "$BACKUP_NAME" > "$STATE_FILE"
  echo "[install] backup em $BACKUP_DIR"
else
  echo "[install] mantendo o backup original para desinstalação"
fi

for relative_path in "${MANAGED_FILES[@]}"; do
  mkdir -p -- "$(dirname -- "$TARGET/$relative_path")"
  cp -- "$SCRIPT_DIR/$relative_path" "$TARGET/$relative_path"
done
chmod +x -- "$TARGET/hooks/pretool-hook.sh" "$TARGET/hooks/posttool-hook.sh"
echo "[install] instruções, skill e hooks instalados em $TARGET"
