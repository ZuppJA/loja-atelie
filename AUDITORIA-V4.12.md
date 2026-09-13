# Auditoria V4.12 — Fios & Artes

## Frontend

- JavaScript extraído e validado com `node --check`: sem erros de sintaxe.
- Fluxo de cadastro/edição revisado contra as colunas reais de `public.products`.
- `publication_status` (`draft`, `published`, `hidden`) passou a ser usado no formulário e no catálogo.
- `sale_price` passou a alimentar preço final e percentual de desconto.
- `product_categories` passou a ser carregada e usada para filtro e edição de múltiplas categorias.
- WhatsApp do produto é armazenado em `products.whatsapp`; o perfil não preenche mais automaticamente o campo do novo produto.
- Validações impedem gravação quando faltam nome, categoria, preço, estoque inicial, imagem, DDD, telefone ou publicação.
- Falhas posteriores à criação não exibem sucesso falso; no cadastro novo, o produto é removido quando não foi possível completar categorias/imagem.

## Banco

- Migração `v4_12_product_rules_and_fk_indexes` aplicada.
- Migração `v4_12_require_product_category` aplicada.
- Migração `v4_12_category_fk_consistency` aplicada.
- Trigger de preço sincroniza `sale_price` e `discount_percent`.
- Trigger de estoque impede novos produtos com estoque 0.
- `category_id` ficou `NOT NULL`.
- Índices das FKs principais foram adicionados.
- `sync_product_publication_status` recebeu `search_path` fixo.

## Testes realizados

1. Inserção transacional de produto de teste com `price=100`, `sale_price=90`, `stock=1`, `publication_status=draft`: retornou `sale_price=90`, `discount_percent=10` e `active=false`.
2. Tentativa transacional de novo produto com `stock=0`: bloqueada pela regra de estoque.
3. Confirmação posterior: nenhum registro de teste permaneceu no banco.
4. Estrutura de `product_categories` verificada: chave primária `(product_id, category_id)` e políticas RLS de proprietário/admin existentes.
5. JavaScript validado com `node --check`.
