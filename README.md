# Fios & Artes — v4.12.23

## Correção: usuário excluído pela Gestão não permanece visualmente logado

Quando a Gestão exclui uma conta, o Supabase pode ainda manter no navegador do usuário excluído uma sessão JWT válida até sua expiração. Isso fazia o cabeçalho continuar mostrando o nome/perfil, mesmo que o cadastro já não existisse e as operações da conta falhassem.

### Correção implementada

- O aplicativo verifica se o registro do usuário ainda existe em `public.profiles`.
- Se o perfil foi excluído, a sessão local é encerrada imediatamente.
- O estado local de perfil, favoritos, notificações, solicitação de vendedor e sacola é limpo.
- O usuário volta para a página inicial como visitante, com `Entrar` no cabeçalho.
- A verificação ocorre:
  - na inicialização;
  - ao retornar ao navegador/aba;
  - ao recuperar o foco da janela;
  - automaticamente a cada 30 segundos enquanto a página estiver visível.
- A exclusão administrativa continua sendo feita pela função existente `admin_delete_user`, que remove o usuário de `auth.users`.

## Preservado

A interface, catálogo, Gestão, Área do vendedor, moderação, destaques, sacola e demais funções da versão anterior foram mantidos.

## Validação

- JavaScript validado com `node --check`.
- Nenhuma alteração destrutiva foi feita nas tabelas ou nos dados existentes.
