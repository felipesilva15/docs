---
sidebar_position: 2
tags: [SQL, SQL Server]
---

# 002 - Entidades e Atributos

Agora que você já sabe o que é um banco de dados e criou o seu primeiro, chegou a hora de entender como organizar as informações dentro dele. Nesta aula, vamos falar sobre **entidades e atributos**, dois conceitos fundamentais para estruturar seus dados corretamente.

---

## O que são entidades?

Uma **entidade**, também conhecida como **tabela**, é qualquer coisa que queremos armazenar informações sobre. Podemos pensar em uma entidade como um **objeto do mundo real** que possui características próprias.

Imagine que estamos criando um sistema para uma biblioteca. Algumas entidades que podemos identificar são:

- **Livro**
- **Cliente**
- **Empréstimo**

Cada uma dessas entidades representa algo concreto que precisa ser armazenado no banco de dados.

---

## O que são atributos?

Os **atributos**, também conhecidos como **colunas**, são as características que descrevem uma entidade. Cada entidade pode ter vários atributos.

Imagine as caracteríscas que cada entidade da nossa biblioteca possui.  

- **Livro**: título, autor, ano de publicação, ISBN.
- **Cliente**: nome, telefone, e-mail, data de nascimento.
- **Empréstimo**: data de empréstimo, data de devolução, status.

Se fizermos uma comparação simples, podemos pensar em uma entidade como um **formulário** e os atributos como os **campos** a serem preenchidos.

Se representarmos a entidade **Livro** como uma tabela no banco de dados, ficaria assim:

| ID  | Título             | Autor                    | Ano  | ISBN              |
| --- | ------------------ | ------------------------ | ---- | ----------------- |
| 1   | O Pequeno Príncipe | Antoine de Saint-Exupéry | 1943 | 978-3-16-148410-0 |
| 2   | Dom Casmurro       | Machado de Assis         | 1899 | 978-85-359-0277-2 |

- Cada **linha** da tabela representa um **registro** (um livro específico).
- Cada **coluna** representa um **atributo** da entidade.

---

## Tipos dos atributos

Cada atributo precisa de um tipo de dado adequado para armazenar as informações corretamente. No SQL, existem vários tipos de dados, mas os mais comuns são:

| Tipo de dado   | Descrição                                                     | Exemplo                    |
| -------------- | ------------------------------------------------------------- | -------------------------- |
| `INT`          | Números inteiros (sem casas decimais)                         | 10, 2025                   |
| `CHAR(n)`      | Texto com tamanho fixo de "n" caracteres                      | "04862-160","01001-000"    |
| `VARCHAR(n)`   | Texto de até "n" caracteres                                   | "João Silva", "SQL Básico" |
| `DECIMAL(x,y)` | Número com casas decimais (x=Tamanho total, y=Casas decimais) | 99.99, 15.50               |
| `DATE`         | Data                                                          | 2025-03-01                 |
| `DATETIME`     | Data e hora                                                   | 2025-03-01 14:30:00        |
| `BOOLEAN`      | erdadeiro ou falso (1 ou 0)                                   | 1 (Sim), 0 (Não)           |

### Escolhendo o tipo certo

É importante escolher o tipo correto para cada atributo, pois isso afeta o desempenho e a integridade dos dados.

Exemplos:

- Para armazenar **o nome de um cliente**, usamos `VARCHAR(100)`, pois é um texto de tamanho variável.
- Para armazenar **o ano de publicação de um livro**, usamos `INT`, pois trata-se de um número inteiro.
- Para armazenar **o preço de um livro**, usamos `DECIMAL(6,2)`, pois precisamos de valores com casas decimais (exemplo: 99.99).
- Para armazenar **se um livro está disponível para empréstimo**, usamos `BOOLEAN`, pois queremos apenas dois valores possíveis: `1` (Sim) ou `0` (Não).

---

## Criando uma tabela no SQL

Agora que entendemos os conceitos de entidade, atributos e tipos de dados, vamos criar a tabela **Livro** no SQL Server:

```sql
CREATE TABLE Livro (
    ID INT PRIMARY KEY,
    TITULO VARCHAR(255),
    AUTOR VARCHAR(255),
    ANO INT,
    ISBN VARCHAR(20),
    PRECO DECIMAL(5,2),
    DISPONIVEL BOOLEAN
);
```

Explicação do comando:

- `CREATE TABLE Livro`: Cria uma nova tabela chamada `Livro`.
- `ID INT PRIMARY KEY`: Cria uma coluna `ID` do tipo número inteiro (`INT`) e a define como chave primária (única para cada livro).
- `TITULO VARCHAR(255)`: Cria uma coluna `Titulo` que aceita textos de até 255 caracteres.
- `AUTOR VARCHAR(255)`: Cria uma coluna `Autor` para armazenar o nome do autor.
- `ANO INT`: Cria uma coluna `Ano` para armazenar o ano de publicação.
- `ISBN VARCHAR(20)`: Cria uma coluna `ISBN` para armazenar o código ISBN do livro.
- `PRECO DECIMAL(5,2)`: Cria uma coluna `Preco` para armazenar o valor do livro com duas casas decimais.
- `DISPONIVEL BOOLEAN`: Cria uma coluna `Disponivel` para indicar se o livro está disponível para empréstimo (`1` para Sim, `0` para Não).

---

## Conclusão

Nesta aula, aprendemos que:

- Entidades são os objetos principais que armazenamos no banco de dados.
- Atributos são as características que descrevem uma entidade.
- As tabelas no SQL representam entidades, e as colunas representam os atributos.
- Cada atributo tem um **tipo de dado** apropriado para garantir que as informações sejam armazenadas corretamente.
