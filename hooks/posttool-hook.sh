#!/bin/bash
# Formata arquivos após edição
echo "[PostToolUse] Rodando lint/format"
prettier --write "$TARGET" 2>/dev/null || true
