---
sidebar_position: 4
tags: [SQL, SQL Server]
---

# 004 - Relacionamento entre tabelas

Ao trabalhar com bancos de dados relacionais, é fundamental compreender como as tabelas se relacionam entre si. Nesta aula, você aprenderá sobre os tipos de relacionamento entre tabelas, como criar essas relações e como utilizá-las para recuperar informações de maneira eficiente.

---

## O que é um relacionamento entre tabelas?

Um banco de dados relacional organiza suas informações em tabelas, mas muitas vezes os dados de uma tabela estão relacionados aos de outra. O relacionamento entre tabelas permite que esses dados sejam conectados de forma eficiente, evitando redundâncias e garantindo a integridade dos dados.

Por exemplo, imagine um sistema de uma livraria onde temos:

- Uma tabela **CLIENTES**, que armazena informações sobre os clientes.
- Uma tabela **EMPRESTIMOS**, que armazena os empréstimos feitos pelos clientes.

Cada empréstimo precisa estar vinculado a um cliente. Essa conexão é feita através de um relacionamento entre tabelas.

---

## Chaves primárias e estrangeiras

Para criar relacionamentos entre tabelas, utilizamos **chaves primárias** e **chaves estrangeiras**:

- **Chave primária (Primary Key - PK)**: Identifica de forma única um registro dentro de uma tabela.
- **Chave estrangeira (Foreign Key - FK)**: É uma coluna que faz referência à chave primária de outra tabela, estabelecendo a conexão entre os dados.

---

## Tipos de relacionamento

Existem três tipos principais de relacionamento entre tabelas:

### Relacionamento um para um (1:1)

Neste tipo de relacionamento, cada registro em uma tabela está relacionado com no máximo um registro em outra tabela.

**Exemplo:** Uma tabela **CLIENTES** e uma tabela **DOCUMENTOS**, onde cada cliente tem um único documento associado.

```sql
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100)
);

CREATE TABLE DOCUMENTOS (
    ID INT PRIMARY KEY,
    ID_CLIENTE INT UNIQUE,
    DOCUMENTO VARCHAR(20),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID)
);
```

O uso da restrição `UNIQUE` na chave estrangeira impede que um cliente tenha mais de um documento cadastrado.

---

### Relacionamento um para muitos (1:N)

Este é o tipo de relacionamento mais comum. Um registro em uma tabela pode estar relacionado a vários registros em outra tabela.

**Exemplo:** Uma tabela **CLIENTES** e uma tabela **EMPRESTIMOS**, onde cada cliente pode ter vários empréstimos, mas cada empréstimo pertence a apenas um cliente.

```sql
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100)
);

CREATE TABLE EMPRESTIMOS (
    ID INT PRIMARY KEY,
    ID_CLIENTE INT,
    DATA_EMPRESTIMO DATE,
    FOREIGN KEY (ID_CLIENTE) REFERENCES Clientes(ID)
);
```

Neste caso, a chave estrangeira `ID_CLIENTE` na tabela **EMPRESTIMOS** faz referência à chave primária da tabela **CLIENTES**.

---

### Relacionamento muitos para muitos (N:N)

Neste relacionamento, um registro em uma tabela pode estar associado a vários registros em outra tabela, e vice-versa. Para implementar isso, utilizamos uma **tabela intermediária**.

**Exemplo:** Uma tabela **ALUNOS** e uma tabela **CURSOS**, onde cada aluno pode se matricular em vários cursos e cada curso pode ter vários alunos.

```sql
CREATE TABLE ALUNOS (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100)
);

CREATE TABLE CURSOS (
    ID INT PRIMARY KEY,
    NOME VARCHAR(100)
);

CREATE TABLE MATRICULAS (
    ID_ALUNO INT,
    ID_CURSO INT,
    DATA_MATRICULA DATE,
    PRIMARY KEY (ID_ALUNO, ID_CURSO),
    FOREIGN KEY (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO),
    FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSO)
);
```

A tabela **MATRICULAS** atua como uma ponte entre **ALUNOS** e **CURSOS**, estabelecendo o relacionamento N:N.

---

## Consultando dados relacionados

Para consultar dados de tabelas relacionadas, utilizamos **JOINs**.

**Exemplo:** Buscar os emprestimos de cada cliente usando `INNER JOIN`.

```sql
SELECT 
    CLI.NOME, 
    EMP.ID AS "ID_EMPRESTIMO",
    EMP.DT_EMPRESTIMO
FROM CLIENTES AS CLI
INNER JOIN EMPRESTIMOS AS EMP ON CLI.ID = EMP.ID_CLIENTE;
```

**Outros tipos de JOIN:**

- `INNER JOIN`: Retorna apenas os registros que possuem correspondência em ambas as tabelas.
- `LEFT JOIN`: Retorna todos os registros da tabela da esquerda e os correspondentes da tabela da direita (se houver).
- `RIGHT JOIN`: Retorna todos os registros da tabela da direita e os correspondentes da tabela da esquerda (se houver).
- `FULL JOIN`: Retorna todos os registros quando há correspondência em uma das tabelas.

---

## Conclusão

Nesta aula, aprendemos:

- O que são relacionamentos entre tabelas e sua importância.
- Os tipos de relacionamento: Um para Um, Um para Muitos e Muitos para Muitos.
- Como utilizar chaves primárias e estrangeiras para criar relacionamentos.
- Como consultar dados relacionados usando `JOIN`.
