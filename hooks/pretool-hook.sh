#!/bin/bash
# Bloqueia escrita fora de ~/.claude
if [[ "$TARGET" != "$HOME/.claude"* ]]; then
  echo "[PreToolUse] Caminho proibido: $TARGET"
  exit 1
fi
