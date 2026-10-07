ENTREVISTA.md
Pergunta 1 do agente: Como organizar as pastas do repositório?
Recomendação: Criar uma pasta única artifacts/ e dentro dela subpastas para skills e hooks.
Minha resposta: Preferi manter skills/ e hooks/ diretamente na raiz, porque o autograder pede caminhos explícitos e isso facilita a leitura da árvore.

Pergunta 2 do agente: Qual linguagem usar para o script de instalação?
Recomendação: Usar Python, por ser multiplataforma e já disponível no ambiente.
Minha resposta: Escolhi Bash (install.sh), porque é mais simples para manipular arquivos e backups, não exige dependências extras e cumpre o requisito de idempotência. Reconheço que Bash não entrega a mesma portabilidade para Windows puro, mas no contexto do autograder isso não é necessário.

Pergunta 3 do agente: O que versionar como instruções globais?
Recomendação: Versionar todos os arquivos de configuração, inclusive .env.
Minha resposta: Não versionei .env nem credenciais, apenas CLAUDE.md com instruções globais, porque segredos não devem ir para o repositório privado.

Pergunta 4 do agente: Como implementar os hooks?
Recomendação: Declarar comandos inline dentro do settings.json.
Minha resposta: Criei dois arquivos separados em hooks/ (um PreToolUse e um PostToolUse), porque o exercício exige arquivos versionados e isso ensina o formato a quem clonar.

Pergunta 5 do agente: Onde salvar os backups?
Recomendação: Usar /tmp para simplificar.
Minha resposta: Mantive os backups em ~/.claude/backups/ com timestamp, porque o exercício pede persistência e reversão confiável, não apenas temporária.

Pergunta 6 do agente: Como lidar com pacotes externos?
Recomendação: Declarar dependências em requirements.txt.
Minha resposta: Não declarei pacotes, porque Bash não precisa de dependências externas para copiar e restaurar arquivos.

Pergunta 7 do agente: Como registrar a entrevista?
Recomendação: Fazer um resumo em poucas linhas.
Minha resposta: Registrei cada pergunta, recomendação e resposta detalhada, para cumprir o critério de ≥20 linhas e mostrar divergências claras.

Pergunta 8 do agente: Qual nome usar para o arquivo de instruções globais?
Recomendação: Usar AGENTS.md.
Minha resposta: Preferi CLAUDE.md, porque combina melhor com o harness que estou usando.

Pergunta 9 do agente: Como garantir idempotência?
Recomendação: Rodar sempre um diff antes de copiar.
Minha resposta: Optei por verificar se o backup já existe e se os arquivos não mudaram; se nada mudou, não cria novo backup.

Pergunta 10 do agente: Como documentar a instalação?
Recomendação: Apenas explicar no README.
Minha resposta: Além do README, incluí a saída bruta em evidencia-instalacao.txt, como o exercício exige.