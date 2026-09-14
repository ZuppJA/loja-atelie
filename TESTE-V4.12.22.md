# Testes v4.12.22

- JavaScript validado com `node --check`.
- Suspensão: `admin_suspend_product` mantém `active=false` e `featured=false`.
- Correção do vendedor: produto suspenso permanece `pending_review` e `active=false`.
- Aprovação da correção: `review_product_moderation(..., true)` retorna o produto a `approved`/`active=true`.
- Reativação administrativa: criada `admin_reactivate_product`; produto suspenso pode ser reativado diretamente pela Gestão.
- Destaques: catálogo inicial considera apenas `featured=true`, publicado, aprovado, ativo e estoque > 0.
- Sacola: item suspenso/em análise/sem estoque é identificado como indisponível, não aceita aumento de quantidade e não pode ser enviado para compra.
- Sacola: itens disponíveis do mesmo vendedor continuam compráveis mesmo que outro item da sacola esteja bloqueado.
