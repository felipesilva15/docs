---
sidebar_position: 5
tags: [SQL, SQL Server]
---

# 005 - Consultas avançadas

Nesta aula, aprenderemos sobre consultas SQL mais avançadas, utilizando os comandos `WHERE`, `ORDER BY`, `HAVING`, `GROUP BY` e algumas funções mais utilizadas para manipulação de dados e agrupamentos.

---

## Utilizando o WHERE para filtragem de dados

O comando `WHERE` é utilizado para filtrar registros de acordo com uma condição especificada.

**Exemplo:** Buscar todos os clientes da cidade de "São Paulo".

```sql
SELECT 
    *
FROM CLIENTES
WHERE 
    CIDADE = 'São Paulo';
```

### Operadores comuns no WHERE

| Operador      | Descrição                                                               | Exemplo                                                   |
| ------------- | ----------------------------------------------------------------------- | --------------------------------------------------------- |
| `=`           | Igual                                                                   | `SELECT * FROM CLIENTES WHERE IDADE = 30;`                |
| `!=` ou `<>`  | Diferente                                                               | `SELECT * FROM CLIENTES WHERE IDADE != 30;`               |
| `>`           | Maior que                                                               | `SELECT * FROM CLIENTES WHERE IDADE > 30;`                |
| `<`           | Menor que                                                               | `SELECT * FROM CLIENTES WHERE IDADE < 30;`                |
| `>=`          | Maior ou igual a                                                        | `SELECT * FROM CLIENTES WHERE IDADE >= 30;`               |
| `<=`          | Menor ou igual a                                                        | `SELECT * FROM CLIENTES WHERE IDADE <= 30;`               |
| `BETWEEN`     | Dentro de um intervalo                                                  | `SELECT * FROM CLIENTES WHERE IDADE BETWEEN 15 AND 18;`   |
| `IN`          | Verifica se o valor está dentro de um conjunto                          | `SELECT * FROM CLIENTES WHERE IDADE IN (15, 16, 17, 18);` |
| `LIKE`        | Busca uma palavra contida em textos, onde "%" representa qualquer coisa | `SELECT * FROM CLIENTES WHERE NOME LIKE '%FE%'`           |

---

## Ordenando resultados com ORDER BY

O `ORDER BY` é utilizado para ordenar os resultados da consulta.

- `ASC` (padrão) ordena de forma crescente.
- `DESC` ordena de forma decrescente.

**Exemplo:** Ordenar os clientes por nome em ordem alfabética.

```sql
SELECT 
    * 
FROM CLIENTES
ORDER BY 
    NOME ASC;
```

**Exemplo:** Listar livros ordenados pelo maior preço primeiro.

```sql
SELECT 
    * 
FROM LIVROS
ORDER BY 
    PRECO DESC;
```

---

## Agrupando dados com GROUP BY

O `GROUP BY` é utilizado para agrupar registros com base em um ou mais campos, geralmente combinado com funções de agregação.

**Exemplo:** Contar quantos empréstimos cada cliente fez.

```sql
SELECT 
    ID_CLIENTE, 
    COUNT(*) AS "QTD_EMPRESTIMOS"
FROM EMPRESTIMOS
GROUP BY 
    ID_CLIENTE;
```

---

## Filtrando grupos com HAVING

Diferente do `WHERE`, que filtra registros individuais, o `HAVING` é usado para filtrar grupos de dados após a aplicação do `GROUP BY`.

**Exemplo:** Exibir apenas clientes que tenham feito mais de 5 empréstimos.

```sql
SELECT 
    ID_CLIENTE, 
    COUNT(*) AS "QTD_EMPRESTIMOS"
FROM EMPRESTIMOS
GROUP BY 
    ID_CLIENTE
HAVING 
    COUNT(*) > 5;
```

---

## Funções mais utilizadas

Abaixo irei citar as funções mais comuns do SQL Server, mas sinta-se a vontade para procurar por outras funções na internet. Minha recomendação é o site da [W3 Schools](https://www.w3schools.com/sql/sql_ref_sqlserver.asp).

### Funções de agregação

| Função       | Descrição                               | Exemplo                                                  |
| ------------ | --------------------------------------- | -------------------------------------------------------- |
| `COUNT(*)`   | Conta o número de registros             | `SELECT COUNT(*) AS "QTD_LIVROS" FROM LIVROS;`           |
| `SUM(campo)` | Soma os valores de um campo             | `SELECT SUM(PRECO) AS "VL_TOTAL_LIVROS" FROM LIVROS;`    |
| `AVG(campo)` | Calcula a média dos valores de um campo | `SELECT AVG(PRECO) AS "MEDIA_PRECO_LIVROS" FROM LIVROS;` |
| `MAX(campo)` | Retorna o maior valor                   | `SELECT MIN(PRECO) AS "MENOR_PRECO" FROM LIVROS;`        |
| `MIN(campo)` | Retorna o menor valor                   | `SELECT MAX(PRECO) AS "MAIOR_PRECO" FROM LIVROS;`        |

### Funções de manipulação de texto

| Função                              | Descrição                       | Exemplo                                                                       |
| ----------------------------------- | ------------------------------- | ----------------------------------------------------------------------------- |
| `UPPER(campo)`                      | Converte o texto para maiúsculo | `SELECT UPPER(NOME) AS "NOME" FROM CLIENTES;`                                 |
| `LOWER(campo)`                      | Converte o texto para minúsculo | `SELECT LOWER(NOME) AS "NOME" FROM CLIENTES;`                                 |
| `LEN(campo)`                        | Retorna o tamanho do texto      | `SELECT LEN(NOME) AS "QTD_LETRAS_NOME" FROM CLIENTES;`                        |
| `SUBSTRING(campo, inicio, tamanho)` | Retorna parte do texto          | `SELECT SUBSTRING(NOME, 1, 3) AS "PRIMEIRAS_TRES_LETRAS_NOME" FROM CLIENTES;` |

---

## Conclusão

Nesta aula, aprendemos:

- Como utilizar `WHERE` para filtrar registros.
- Como ordenar os resultados com `ORDER BY`.
- Como agrupar registros usando `GROUP BY`.
- Como filtrar grupos de dados com `HAVING`.
- As principais funções SQL utilizadas para agregação e manipulação de texto.
