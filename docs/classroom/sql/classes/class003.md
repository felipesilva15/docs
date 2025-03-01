---
sidebar_position: 3
tags: [SQL, SQL Server]
---

# 003 - Principais comandos SQL para CRUD  

Agora que já aprendemos sobre **entidades e atributos**, chegou o momento de interagir com os dados do banco!  

Nesta aula, você vai aprender os comandos básicos do SQL para realizar operações de **CRUD** (_Create, Read, Update, Delete_), que são as quatro operações fundamentais para manipular dados em um banco relacional.  

---

## O que é CRUD?  

CRUD é um acrônimo para:  

- **C**reate (_Criar_) → Inserir novos dados.  
- **R**ead (_Ler_) → Consultar dados armazenados.  
- **U**pdate (_Atualizar_) → Modificar dados existentes.  
- **D**elete (_Excluir_) → Remover dados do banco.  

Essas quatro operações são utilizadas na maioria dos sistemas que trabalham com bancos de dados, como redes sociais, e-commerces e aplicativos de gestão.  

Agora, vamos ver como cada uma dessas operações é realizada no SQL!  

---

## Operadores  

Para tornar as consultas mais poderosas, podemos utilizar **operadores de comparação** (para comparar entre dois valores ou mais), **operadores lógicos** (para combinar condições) e **operadores matemáticos** (para realizar cálculos nos dados).  

### Operadores de comparação  

Os operadores de comparação são usados para comparar valores em consultas SQL.  

| Operador     | Descrição        | Exemplo                                     |
| ------------ | ---------------- | ------------------------------------------- |
| `=`          | Igual            | `SELECT * FROM CLIENTES WHERE Idade = 30;`  |
| `!=` ou `<>` | Diferente        | `SELECT * FROM CLIENTES WHERE Idade != 30;` |
| `>`          | Maior que        | `SELECT * FROM CLIENTES WHERE Idade > 30;`  |
| `<`          | Menor que        | `SELECT * FROM CLIENTES WHERE Idade < 30;`  |
| `>=`         | Maior ou igual a | `SELECT * FROM CLIENTES WHERE Idade >= 30;` |
| `<=`         | Menor ou igual a | `SELECT * FROM CLIENTES WHERE Idade <= 30;` |

**Exemplo prático:** Buscar todos os clientes com idade maior ou igual a 25 anos.  

```sql
SELECT 
    * 
FROM CLIENTES 
WHERE 
    IDADE >= 25;
```

---

### Operadores lógicos  

Os operadores lógicos são usados no `WHERE` para combinar múltiplas condições.  

| Operador | Descrição                                                             | Exemplo                                                             |
| -------- | --------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `AND`    | Retorna verdadeiro se **todas** as condições forem verdadeiras        | `SELECT * FROM CLIENTES WHERE Idade > 25 AND Cidade = 'São Paulo';` |
| `OR`     | Retorna verdadeiro se **pelo menos uma** das condições for verdadeira | `SELECT * FROM CLIENTES WHERE Idade > 25 OR Cidade = 'São Paulo';`  |
| `NOT`    | Inverte o resultado da condição (**Negação**)                         | `SELECT * FROM CLIENTES WHERE NOT Cidade = 'São Paulo';`            |

**Exemplo prático:** Buscar o nome, idade e cidade de clientes que têm mais de 25 anos e moram em São Paulo.

```sql
SELECT 
    NOME, 
    IDADE, 
    CIDADE 
FROM CLIENTES 
WHERE 
        IDADE > 25 
    AND CIDADE = 'São Paulo';
```

---

### Operadores matemáticos  

Os operadores matemáticos permitem realizar cálculos com valores numéricos.  

| Operador | Descrição                 | Exemplo                            |
| -------- | ------------------------- | ---------------------------------- |
| `+`      | Adição                    | `SELECT Preco + 10 FROM Produtos;` |
| `-`      | Subtração                 | `SELECT Preco - 5 FROM Produtos;`  |
| `*`      | Multiplicação             | `SELECT Preco * 2 FROM Produtos;`  |
| `/`      | Divisão                   | `SELECT Preco / 2 FROM Produtos;`  |
| `%`      | Módulo (resto da divisão) | `SELECT Idade % 2 FROM CLIENTES;`  |

**Exemplo prático:** Exibir o nome, preço e preço um desconto de 10% de todos os produtos.

```sql
SELECT 
    NOME, 
    PRECO, 
    PRECO * 0.90 AS "PRECO_COM_DESCONTO"
FROM PRODUTOS;
```

**Explicação:**  

- `PRECO * 0.90`: Aplica o desconto de 10%.  
- `AS PRECO_COM_DESCONTO`: Renomeia a coluna para facilitar a leitura do resultado.  

---

## 1. Criando dados no banco (`INSERT`)  

Para adicionar informações a uma tabela, usamos o comando **`INSERT INTO`**.  

### Inserindo um novo cliente  

```sql
INSERT INTO 
    CLIENTES 
        (NOME, IDADE, EMAIL)
    VALUES
        ('Ana Souza', 28, 'ana@email.com');
```

**Explicação:**  

- `INSERT INTO CLIENTES`: Define que estamos inserindo dados na tabela `CLIENTES`.  
- `(NOME, IDADE, EMAIL)`: Especifica as colunas que receberão os valores.  
- `VALUES ('Ana Souza', 28, 'ana@email.com')`: Informa os valores que serão inseridos.  

**Dica:** Sempre verifique a ordem das colunas para evitar erros.  

---

## 2. Consultando dados (`SELECT`)  

Para buscar informações dentro de uma tabela, usamos o comando **`SELECT`**.  

### Consultar todos os clientes  

```sql
SELECT 
    *
FROM CLIENTES;
```

**Explicação:**  

- `SELECT *`: Seleciona **todas** as colunas da tabela.  
- `FROM CLIENTES`: Define de qual tabela os dados serão extraídos.  

### Consultar clientes com mais de 25 anos  

```sql
SELECT 
    NOME, 
    IDADE 
FROM CLIENTES 
WHERE 
    IDADE > 25;
```

**Explicação:**

- `SELECT NOME, IDADE`: Seleciona apenas as colunas `NOME` e `IDADE`.  
- `WHERE IDADE > 25`: Filtra os resultados para trazer apenas clientes com idade maior que 25.  

### Consultar clientes com nomes intuitivos

```sql
SELECT 
    NOME AS "Nome", 
    IDADE AS "Idade",
    CIDADE AS "Cidade de residência"
FROM CLIENTES;
```

**Explicação:**

- `SELECT CIDADE AS "Cidade de residência"`: Seleciona a coluna `CIDADE` renomeando-a para "Cidade de residência".

---

## 3. Atualizando dados (`UPDATE`)  

Para modificar informações já existentes no banco, usamos o comando **`UPDATE`**.  

### Atualizar o email de um cliente  

```sql
UPDATE CLIENTES
SET 
    EMAIL = 'ana.novo@email.com'
WHERE 
    ID = 1;
```

**Explicação:**  

- `UPDATE CLIENTES`: Define que estamos atualizando a tabela `CLIENTES`.  
- `SET EMAIL = 'ana.novo@email.com'`: Informa qual coluna será alterada e o novo valor.  
- `WHERE ID = 1`: Define **qual registro** será atualizado (sem isso, todos os registros seriam modificados!).  

**Dica:** Sempre use `WHERE` ao atualizar registros para evitar alterações indesejadas em toda a tabela.  

---

## 4. Deletando dados (`DELETE`)  

Para remover um registro do banco, usamos o comando **`DELETE`**.  

### Excluir um cliente pelo nome  

```sql
DELETE FROM CLIENTES WHERE ID = 1;
```

**Explicação:**  

- `DELETE FROM CLIENTES`: Define que estamos removendo dados da tabela `CLIENTES`.  
- `WHERE ID = 1`: Filtra a exclusão para apenas **um cliente**.  

**Cuidado!** Se não colocar `WHERE`, **todos os registros da tabela serão apagados!**  

---

## Conclusão  

Nesta aula, aprendemos:  

- O conceito de **CRUD** e sua importância.  
- Como **inserir** (`INSERT`), **consultar** (`SELECT`), **atualizar** (`UPDATE`) e **deletar** (`DELETE`) dados no SQL.  
- Tipos de operadores.
