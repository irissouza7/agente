# Repositório de artefatos do agente

Este repositório instala instruções globais do harness, uma skill e hooks
`PreToolUse` e `PostToolUse` em `~/.claude`.

## Instalação

1. Clone este repositório:

   ```bash
   git clone https://github.com/irissouza7/agente.git
   cd agente
   ```

2. Execute o script de instalação:

   ```bash
   bash ./install.sh
   ```

O script não exige dependências externas. Ele instala os arquivos versionados
em `~/.claude` (ou em `CLAUDE_CONFIG_DIR`, se definida), preserva os arquivos
que já existiam e pode ser executado novamente sem criar cópias aninhadas ou
substituir o backup original. Assim, clonar o mesmo commit e executar o mesmo
comando reproduz a instalação.

## Desinstalação

Para remover os artefatos instalados e restaurar os arquivos que existiam antes
da instalação, execute na pasta do repositório:

```bash
bash ./install.sh --uninstall
```

O backup fica em `~/.claude/backups/` (ou
`$CLAUDE_CONFIG_DIR/backups/`). A desinstalação restaura somente os arquivos
salvos no backup e remove os arquivos que foram criados pela instalação.

## Verificação de segredos

Não versione `.env`, tokens, senhas ou chaves privadas. Antes de enviar
alterações, revise o conteúdo staged e verifique o repositório com Gitleaks:

```bash
git diff --cached
gitleaks dir --redact .
```

Investigue qualquer detecção antes de publicar. A verificação automatizada é
uma defesa adicional; ela não substitui a revisão dos arquivos e do histórico.
