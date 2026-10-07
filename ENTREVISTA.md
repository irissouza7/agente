ENTREVISTA.md
Pergunta 1 do agente: Como organizar as pastas do repositório?
Recomendação: Colocar tudo em uma única pasta artifacts/ e dentro dela subpastas para skills e hooks.
Minha resposta: Prefiro manter skills/ e hooks/ diretamente na raiz, porque o autograder pede caminhos explícitos e isso facilita a leitura da árvore.

Pergunta 2 do agente: Qual linguagem usar para o script de instalação?
Recomendação: Usar Python, já que é multiplataforma e você já tem ambiente virtual.
Minha resposta: Escolhi Bash (install.sh), porque é mais simples para rodar em qualquer máquina Unix‑like e o autograder aceita qualquer linguagem. Além disso, Bash facilita lidar com backups e cópias de arquivos sem precisar instalar pacotes.

Pergunta 3 do agente: O que versionar como instruções globais?
Recomendação: Versionar todos os arquivos de configuração, inclusive .env.
Minha resposta: Não versionei .env nem credenciais, apenas CLAUDE.md com instruções globais, porque segredos não devem ir para o repositório privado.

Pergunta 4 do agente: Como implementar os hooks?
Recomendação: Declarar comandos inline dentro do settings.json.
Minha resposta: Criei dois arquivos separados em hooks/ (um PreToolUse e um PostToolUse), porque o exercício exige arquivos versionados e isso ensina o formato a quem clonar.