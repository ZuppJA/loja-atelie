# Fios & Artes V4.12.1

Patch de autenticação sobre a V4.12.

A interface e a estrutura do site foram preservadas. Esta versão melhora mensagens de erro dos fluxos de confirmação e recuperação de e-mail.

**Importante:** o envio para clientes reais depende de SMTP próprio configurado no Supabase. O SMTP padrão hospedado é restrito a endereços autorizados da equipe do projeto.


## V4.12.2 — autenticação no GitHub Pages

O retorno dos e-mails de confirmação e recuperação foi corrigido para usar o endereço público real do site:
`https://zuppja.github.io/loja-atelie/`

### Configuração necessária no Supabase
Em **Authentication → URL Configuration**:
- **Site URL:** `https://zuppja.github.io/loja-atelie/`
- **Redirect URLs:** `https://zuppja.github.io/loja-atelie/`

O frontend usa essa mesma URL em `signUp`, `resend` e `resetPasswordForEmail`. O fluxo de recuperação agora abre uma tela própria no site, em vez de usar o `prompt()` do navegador.

### Importante sobre envio de e-mail
A correção acima resolve o destino dos links. A entrega para endereços externos ainda depende da configuração de SMTP/provedor de e-mail do projeto Supabase. Nenhuma chave secreta foi embutida no frontend.
