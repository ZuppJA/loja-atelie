# 🧵 Fios & Artes

Plataforma web de comércio e divulgação de produtos artesanais, desenvolvida para conectar clientes, vendedores e gestores em um único sistema.

O projeto possui catálogo de produtos, autenticação de usuários, área do vendedor, gerenciamento administrativo, favoritos, estoque, múltiplas imagens, integração com WhatsApp e sistema de notificações.

---

## 🚀 Funcionalidades

### 👤 Usuários
- Cadastro e login.
- Autenticação integrada ao Supabase.
- Perfil do usuário.
- Favoritos.
- Controle de sessão.
- Diferenciação entre usuários comuns, vendedores e gestores.

### 🛍️ Catálogo
- Exibição e navegação de produtos.
- Busca de produtos.
- Página/detalhes do produto.
- Galeria com múltiplas imagens.
- Informações de preço e estoque.
- Contato com o vendedor.

### 🧶 Vendedores
- Área exclusiva para vendedores.
- Cadastro e edição de produtos.
- Gerenciamento de estoque.
- Gerenciamento de imagens.
- Informações de contato.
- Integração com WhatsApp.

### ⚙️ Gestão
- Área administrativa.
- Gerenciamento de usuários.
- Controle de permissões.
- Gerenciamento de vendedores.
- Administração de produtos e informações da plataforma.

### 🔔 Outros recursos
- Sistema de notificações.
- Interface responsiva.
- Modais adaptados para dispositivos móveis.
- Galeria de imagens.
- Controle de disponibilidade e estoque.
- Integração com WhatsApp.

---

## 🛠️ Tecnologias

- **HTML5** — estrutura da aplicação.
- **CSS3** — interface, layout e responsividade.
- **JavaScript** — lógica e interações.
- **Supabase** — backend, banco de dados e autenticação.
- **PostgreSQL** — banco de dados utilizado pelo Supabase.

A versão atual utiliza uma estrutura simplificada de implantação, concentrando a aplicação no arquivo:

```text
index.html
```

---

## 📁 Estrutura

```text
Fios-e-Artes/
│
├── index.html
└── README.md
```

O `index.html` contém a aplicação web, incluindo estrutura HTML, estilos CSS e lógica JavaScript.

Arquivos de migração SQL e documentação de desenvolvimento podem ser mantidos separadamente quando necessários e não fazem parte do pacote mínimo de execução do site.

---

## 🗄️ Supabase

O Supabase é responsável pela infraestrutura de dados e autenticação da aplicação.

Entre os recursos utilizados estão:

- Autenticação de usuários.
- Banco de dados PostgreSQL.
- Dados de usuários.
- Produtos.
- Estoque.
- Imagens dos produtos.
- Favoritos.
- Notificações.
- Controle de funções e permissões.

As configurações do banco e as políticas de segurança devem ser mantidas no projeto Supabase correspondente.

> **Importante:** nunca publique senhas, chaves privadas, `service_role keys` ou outras credenciais sensíveis no GitHub.

---

## 📱 Responsividade

A aplicação foi desenvolvida para funcionar em diferentes tamanhos de tela:

- 📱 Celulares
- 📲 Tablets
- 💻 Computadores

A versão atual inclui correções específicas para formulários e modais em telas menores.

---

## ▶️ Execução

Como a aplicação possui uma estrutura baseada em HTML, CSS e JavaScript, pode ser executada através de um servidor web estático.

O arquivo principal é:

```text
index.html
```

A aplicação também pode ser hospedada em serviços compatíveis com sites estáticos, como GitHub Pages ou plataformas equivalentes.

---

## 🔐 Segurança

As credenciais e configurações sensíveis não devem ser armazenadas diretamente no repositório público.

Recomendações:

- Não publicar senhas.
- Não publicar chaves privadas do Supabase.
- Não utilizar `service_role` no frontend.
- Configurar corretamente as políticas **RLS (Row Level Security)** no Supabase.
- Revisar as permissões de usuários, vendedores e gestores.

---

## 📌 Versão atual

**Fios & Artes — V4.16.2**

Principais pontos da versão:

- Interface responsiva.
- Correções para dispositivos móveis.
- Modal de cadastro de produtos adaptado para telas menores.
- Sistema de produtos e estoque.
- Múltiplas imagens por produto.
- Integração com WhatsApp.
- Sistema de notificações.
- Autenticação e gerenciamento de usuários.
- Área de vendedor.
- Área de gestão.

---

## 📄 Licença

Este projeto é de propriedade de seus respectivos desenvolvedores/proprietários.

A utilização, cópia, modificação ou redistribuição do código deve seguir as condições definidas pelo proprietário do projeto.

---

## 🧵 Fios & Artes

**Uma plataforma para conectar artesanato, vendedores e clientes em um só lugar.**
