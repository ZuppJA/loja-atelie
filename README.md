# Fios & Artes V4.12.3 — Auth corrigido

Preserva a interface e as regras da V4.12.x.

## Correções
- Recuperação de senha agora abre explicitamente a tela **Definir nova senha** no próprio GitHub Pages.
- O fluxo também reage ao evento `PASSWORD_RECOVERY`, inclusive quando o Supabase já consumiu o hash antes do carregamento da página.
- Confirmação de e-mail reage ao evento de login gerado pela confirmação e mostra confirmação de sucesso.
- URL de retorno: `https://zuppja.github.io/loja-atelie/`

## Supabase
Em Authentication > URL Configuration:
- Site URL: `https://zuppja.github.io/loja-atelie/`
- Redirect URL: `https://zuppja.github.io/loja-atelie/`

O envio dos e-mails é responsabilidade do SMTP do Supabase. Se redefinição chega mas confirmação não chega, verificar Auth logs e configuração SMTP/template de confirmação.
