# Teste V4.12.23

1. Entre com uma conta de cliente em um navegador/dispositivo.
2. Abra `Meu perfil` e confirme que o nome aparece no cabeçalho.
3. Em outro acesso com Gestão, exclua essa mesma conta.
4. No dispositivo do usuário excluído, volte à aba do site ou aguarde a verificação automática.
5. Resultado esperado:
   - o nome do usuário desaparece do cabeçalho;
   - o botão `Entrar` volta a aparecer;
   - `Meu perfil` deixa de ficar acessível como conta autenticada;
   - favoritos e sacola autenticados deixam de ser tratados como dados da conta excluída;
   - o usuário pode criar/entrar em outra conta normalmente.

## Teste adicional

Com a conta excluída, tente favoritar/adicionar um produto à sacola antes de recarregar. Ao recuperar o foco da página, a conta deve ser validada e a sessão encerrada.
