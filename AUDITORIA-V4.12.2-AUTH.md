# Auditoria V4.12.2 — autenticação

- Interface e estrutura da V4.12.1 preservadas.
- `APP_URL` alterada do Edge Function para o endereço público do GitHub Pages.
- Cadastro, reenvio de confirmação e recuperação passam a usar a mesma URL pública.
- Recuperação não usa mais `prompt()`: há formulário responsivo com confirmação da senha.
- Após confirmação de e-mail, o hash de autenticação é limpo sem recarregar a página.
- Após troca de senha, o hash também é limpo e o usuário permanece no site.
- Validação JavaScript executada com `node --check`: OK.
- Nenhuma alteração destrutiva no banco de dados.

## Pendência externa
O código não pode, sozinho, habilitar SMTP de produção no painel do Supabase. O provedor de envio precisa estar configurado no projeto.
