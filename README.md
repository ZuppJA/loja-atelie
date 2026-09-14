# Fios & Artes — v4.12.22

Correções desta versão:
- Produto suspenso pela Gestão permanece bloqueado e invisível no catálogo.
- Se o vendedor corrigir um produto suspenso, ele passa para `Em análise` (`pending_review`) e continua fora do catálogo até a Gestão aprovar.
- A Gestão agora possui `Reativar` para produtos suspensos por decisão administrativa. A reativação aprova o produto, ativa-o e remove o destaque automaticamente; o produto só volta ao catálogo se estiver publicado e com estoque.
- Destaque continua condicionado a produto publicado, aprovado, ativo e com estoque; a interface de Gestão usa o valor real de `featured`.
- Produtos suspensos/em análise que já estejam na sacola permanecem visíveis, identificados como indisponíveis e sem possibilidade de aumentar quantidade ou comprar pelo WhatsApp. O cliente pode removê-los da sacola.
- A compra pelo WhatsApp considera somente itens atualmente disponíveis, mesmo que a sacola contenha outro item suspenso.
- O detalhe do produto informa quando ele está suspenso ou aguardando análise.
- Mantidas as correções anteriores de perfil, usuários, solicitações, notificações e organização responsiva.

## Banco
Foi criada a função `public.admin_reactivate_product(uuid)`, protegida por `public.is_admin()`. Ela reativa somente produtos suspensos, limpa o motivo da suspensão, remove destaque e registra uma notificação para o vendedor.

## Publicação
O `index.html` precisa ser publicado no GitHub Pages do projeto. Esta sessão não possui acesso de escrita ao repositório GitHub, portanto o push não foi realizado automaticamente.
