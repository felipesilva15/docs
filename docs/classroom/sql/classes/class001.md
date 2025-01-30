---
sidebar_position: 1
tags: [SQL, SQL Server]
---

# 001 - O que é o SQL?

Tendo o SQL Server instalado em seu computador, você irá aprender o que é o SQL, banco de dados, para que serve e como criar o seu primeiro banco de dados para ser utilizado nas próximas aulas.

## O que é e para que serve o SQL?

O SQL é uma sigla para _Structured Query Language_, que é uma linguagem de programação que serve para minular um bancos de dados reclacional.

## Banco de dados

### O que é e para que serve?

Um banco de dados nada mais é do que um sistema que armazena as informações de forma organizada, estruturada, eficiente e, juntamente com ele, acompanha um sistema de gerenciamento de banco de dados (SGBD) que serve para manipular os dados armazenados banco de dados através de comandos escritos na linguagem de programação SQL.

Nas aulas iremos utilizar o SQL Server, mas existem diversos sistemas de banco de dados disponibilizados para tal função, sendo eles:

- MySQL
- Oracle
- PostgreSQL
- MariaDB
- IBM DB2

### Como funciona?

Um **banco de dados relacional** armazena seus dados em forma de tabelas com linhas e colunas, no quais podem ou não se relacionar com outras tabelas. Fazendo uma comparação leiga... Podemos utilizar o Excel como exemplo.

Um software de banco de dados é instalado em um servidor onde poderão ser criados diversos bancos de dados independentes, onde terão tabelas com linhas e colunas.

Por exemplo, podemos ter uma biblioteca **(Banco de dados)**, no qual possuem livros, clientes e empréstimos **(Tabelas)**, que por suas vez cada um deles possuem características como nome, idade, etc. **(Colunas)** em muitas quantidades **(Linhas)**.

## Primeiro contato

### Acessando o SGBD

Siga o passo a passo para criar seu primeiro banco de dados:

1. Abra o SQL Server Management Studio (SGBD)

2. Conecte ao seu servidor clicando no botão _"Conectar"_

3. Clique no botão _"Nova consulta"_.

Pronto, irá abrir um bloco de notas no qual poderão ser inseridos e executados comandos SQL.

### Sintaxe SQL

Sintaxe é o padrão de escritas de comandos para que eles possam funcionar. Abaixo você verá algumas regras e como normalmente funciona a sintaxe de um código:

1. Cláusulas - São palavras reservadas da linguagem no qual serão complementadas para executar algo em seu banco de dados.
2. Parâmetros - São informações variáveis para informar a cláusula o que ela deve processar
3. Cláusula de finalização - São cláusulas que informam quando um código está em seu fim e deve ser executado. Eles são representados por `GO` ou `;`.

### Criando o seu primeiro banco de dados

Para criar um banco de dados basta utilizar o comando abaixo:

```sql
CREATE DATABASE AulaSQL;
```

Vamos separar este comando com o que foi explicado no tópico anterior:

- `CREATE DATABASE`: Está é a cláusula para criação de um novo banco de dados.
- `AulaSQL`: Este é o parâmetro para criação de um banco de dados, onde neste caso é o nome do nosso banco de dados.
- `;`: Esta é a cláusula de finalização do nosso comando.

Para executarmos este comando basta teclar F5.

## Conclusão

Nesta aula aprendemos o básico do SQL e como podemos escrever nosso primeiro comando para criação de um banco de dados.
