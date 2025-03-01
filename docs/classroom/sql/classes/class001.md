---
sidebar_position: 1
tags: [SQL, SQL Server]
---

# 001 - Introdução ao SQL

Nesta primeira aula, você aprenderá o que é o SQL, para que ele serve e como criar seu primeiro banco de dados no SQL Server.  

Se você já tem o SQL Server instalado, siga os passos desta aula para começar a explorar o mundo dos bancos de dados!  

---

## O que é SQL?

SQL é a sigla para _Structured Query Language_ (Linguagem de Consulta Estruturada). Ele é um conjunto de comandos utilizados para **criar, consultar, atualizar e gerenciar** bancos de dados relacionais.  

Em outras palavras, o SQL permite que você interaja com um banco de dados para armazenar e recuperar informações de forma organizada e eficiente.

### Para que serve o SQL?

Imagine um site de uma loja online. Ele precisa armazenar informações sobre clientes, produtos, pedidos e pagamentos. O SQL é a ferramenta que permite **manipular esses dados**, garantindo que eles sejam armazenados corretamente e possam ser acessados de forma rápida e segura.  

Com o SQL, podemos:

- Criar e organizar bancos de dados;
- Inserir, modificar e excluir dados;
- Consultar informações de maneira eficiente;
- Controlar o acesso e a segurança dos dados.

---

## O que é um banco de dados?

Um **banco de dados** é um sistema utilizado para armazenar e organizar informações de forma estruturada.  

Junto com ele, temos o **Sistema de Gerenciamento de Banco de Dados (SGBD)**, que é o software responsável por manipular os dados armazenados, utilizando comandos SQL.  

### Principais SGBDs

Existem diferentes sistemas de banco de dados disponíveis. Alguns dos mais utilizados são:

- **SQL Server** (Que usaremos nestas aulas)
- **MySQL**
- **Oracle**
- **PostgreSQL**
- **MariaDB**
- **IBM DB2**

### Como funciona um banco de dados relacional?

Os bancos de dados relacionais armazenam dados em **tabelas** organizadas em **linhas e colunas**.  

Podemos compará-los a uma **planilha do Excel**, onde:  

- Cada **tabela** representa um conjunto de informações.
- Cada **linha** representa um registro individual dentro dessa tabela.
- Cada **coluna** representa uma característica dos registros armazenados.  

---

## Primeiro contato com o SQL Server

### Acessando o SGBD

Agora que já entendemos o conceito de bancos de dados, vamos acessar o SQL Server Management Studio para executar nosso primeiro comando.

1. Abra o **SQL Server Management Studio (SSMS)**.
2. Conecte-se ao servidor clicando no botão **"Conectar"**.
3. Clique em **"Nova consulta"** para abrir o editor de comandos SQL.

Agora estamos prontos para executar comandos SQL!

---

## Sintaxe do SQL

A sintaxe do SQL segue um padrão estruturado para que os comandos funcionem corretamente. Vamos entender os principais elementos:

1. **Cláusulas** – São palavras reservadas da linguagem SQL usadas para executar operações (exemplo: `CREATE DATABASE`).
2. **Parâmetros** – São valores fornecidos às cláusulas para definir o que será processado (exemplo: o nome do banco de dados).
3. **Cláusula de finalização** – Indica o fim do comando e pode ser representada por `GO` ou `;`.

---

## Criando seu primeiro banco de dados

Agora vamos criar um banco de dados chamado `AulaSQL`. Para isso, utilizamos o seguinte comando:

```sql
CREATE DATABASE AulaSQL;
```

### Explicação do comando

- `CREATE DATABASE`: Comando para **criar** um novo banco de dados.
- `AulaSQL`: Nome do banco de dados que estamos criando.
- `;`: Indica o fim do comando.

**Para executar esse comando, basta pressionar `F5` no SQL Server Management Studio.**  

Após isso, o banco de dados `AulaSQL` será criado e estará pronto para ser usado nas próximas aulas!

---

## Conclusão

Nesta aula, aprendemos:

- O que é SQL e para que ele serve.  
- O conceito de banco de dados e como ele organiza informações.  
- Como acessar o SQL Server e executar comandos.  
- Como criar o nosso primeiro banco de dados.
