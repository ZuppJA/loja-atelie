# Fios & Artes — V4.12

Versão de evolução da interface V4.10.1, mantendo a estrutura visual e os fluxos existentes.

## Alterações

- Detalhe do produto mostra estoque; 1 unidade recebe o aviso **Última unidade** e 0 mostra **Esgotado**.
- Novo produto: campos obrigatórios marcados com `*` e validação antes de salvar.
- Pelo menos uma categoria é obrigatória; várias categorias podem ser selecionadas.
- Preço original obrigatório; **Preço com desconto** é opcional e a porcentagem é calculada automaticamente.
- Estoque inicial obrigatório a partir de 1; produtos já cadastrados podem ser zerados para ficarem esgotados.
- Imagem obrigatória no cadastro; na edição, a imagem existente pode ser mantida.
- Descrição continua opcional.
- WhatsApp do produto começa vazio e usa DDD separado + número. O código do Brasil (+55) é acrescentado automaticamente ao contato.
- Publicação possui **Publicado**, **Oculto** e **Rascunho**.
- O `publication_status` do banco passa a ser a referência de publicação, mantendo `active` sincronizado pelo trigger existente.
- `sale_price` passa a ser a referência do preço promocional; `discount_percent` é mantido sincronizado pelo banco.
- Categorias múltiplas são gravadas em `product_categories`, preservando `category_id` como categoria principal/compatibilidade.
- Índices das chaves estrangeiras principais foram adicionados para reduzir custo de consultas e joins.
- `products.category_id` agora é obrigatório no banco.
- A regra de estoque inicial também é protegida no banco.

## Compatibilidade

A interface, navegação, cores, responsividade, autenticação, sacola, favoritos, comentários, vendedor e gestão foram preservados. Nenhum produto existente foi alterado deliberadamente.
