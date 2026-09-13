# Teste V4.12.2

## Estático
- [x] JavaScript sintaticamente válido.
- [x] URL de retorno aponta para GitHub Pages.
- [x] `signUp`, `resend` e `resetPasswordForEmail` usam `APP_URL`.
- [x] Fluxo de recuperação possui formulário próprio.

## Teste manual no site
1. Criar uma conta com e-mail real.
2. Abrir o link recebido. O retorno deve ser `https://zuppja.github.io/loja-atelie/`.
3. Entrar na conta.
4. Usar “Esqueci minha senha”.
5. Abrir o link recebido. Deve aparecer “Definir nova senha”.
6. Informar a senha duas vezes e salvar.

Se o passo 1 ou 4 retornar erro de envio, o problema restante é a entrega de e-mail do projeto Supabase (SMTP/rate limit), não o endereço de retorno do aplicativo.
