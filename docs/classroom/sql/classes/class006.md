---
sidebar_position: 6
tags: [SQL, SQL Server]
---

# 006 - Stored Procedures, Views e Transactions

Nesta aula, aprenderemos sobre três conceitos fundamentais do SQL: **Stored Procedures**, **Views** e **Transactions**. Esses recursos permitem maior eficiência e segurança na manipulação de dados em um banco de dados relacional.

---

## Stored Procedures

### O que são e para que servem as procedures?

Uma **Stored Procedure** (Procedimento Armazenado) é um conjunto de comandos SQL armazenados no banco de dados, que podem ser executados repetidamente sem precisar reescrever todo o comando.

As Stored Procedures são úteis para:

- Reutilização de código SQL.
- Melhor desempenho ao evitar o envio repetitivo de comandos.
- Maior segurança ao restringir o acesso direto às tabelas.

### Criando uma Stored Procedure

Abaixo está um exemplo de criação de uma Stored Procedure que retorna todos os clientes de uma cidade específica:

```sql
CREATE PROCEDURE SPU_APLICARDESCONTOLIVRO
    @ID_LIVRO INT,
    @DESCONTO NUMERIC(5, 2)
AS
BEGIN
    DECLARE @PERCENTUAL_DESCONTO DECIMAL(7, 4);
    SET @PERCENTUAL_DESCONTO = 1 - (@DESCONTO / 100);

    UPDATE LIVROS
    SET
        PRECO = PRECO * @PERCENTUAL_DESCONTO
    WHERE
        ID = @ID_LIVRO;

    RETURN "Desconto de " + CAST(@DESCONTO AS VARCHAR(12)) + "% aplicado!";
END;
```

Para executar essa Stored Procedure, basta chamá-la com os parâmetros:

```sql
EXEC SPU_APLICARDESCONTOLIVRO 1, 10;
```

### Alterando e excluindo Stored Procedures

Para modificar uma Stored Procedure, utilizamos `ALTER PROCEDURE`:

```sql
ALTER PROCEDURE SPU_APLICARDESCONTOLIVRO
    @ID_LIVRO VARCHAR(100),
    @DESCONTO NUMERIC(5, 2)
AS
BEGIN
    -- CODIGO NOVO...
END;
```

Para remover uma Stored Procedure, usamos `DROP PROCEDURE`:

```sql
DROP PROCEDURE SPU_APLICARDESCONTOLIVRO;
```

---

## Views

### O que são e para que servem as views?

Uma **View** (Visão) é uma consulta armazenada no banco de dados, que age como uma tabela virtual. Ela facilita consultas complexas e melhora a segurança ao ocultar dados sensíveis.

As Views são úteis para:

- Criar representações simplificadas de tabelas complexas.
- Restringir acesso a determinadas colunas.
- Melhorar a organização das consultas SQL.

### Criando uma View

Abaixo está um exemplo de criação de uma View que retorna apenas informações relevantes dos clientes:

```sql
CREATE VIEW VW_CLIENTES 
AS
SELECT 
    NOME, 
    EMAIL, 
    CIDADE 
FROM CLIENTES;
```

Agora, podemos utilizar essa View como se fosse uma tabela:

```sql
SELECT 
    *
FROM VW_CLIENTES;
```

### Alterando e Excluindo Views

Para modificar uma View existente, utilizamos `ALTER VIEW`:

```sql
ALTER VIEW VW_CLIENTES 
AS
SELECT 
    NOME, 
    EMAIL, 
    IDADE
FROM CLIENTES;
```

Para remover uma View, utilizamos `DROP VIEW`:

```sql
DROP VIEW VW_CLIENTES;
```

---

## Transactions

### O que são e para que servem as transactions?

Uma **Transaction** (Transação) é um conjunto de operações SQL que são executadas como uma única unidade. Se qualquer uma das operações falhar, todas as outras podem ser revertidas para evitar inconsistências no banco de dados.

As Transactions são úteis para:

- Garantir a integridade dos dados.
- Evitar problemas quando múltiplas operações precisam ser concluídas juntas.
- Manter consistência nos registros do banco de dados.

**Observação:** Enquanto a transação não for efetivada as tabelas utilizadas no processos são travadas para evitar que sejam manipulados os dados "sujos".

### Usando Transactions

No exemplo abaixo, realizamos a inserção de um pedido e a atualização do estoque em uma transação. Se qualquer erro ocorrer, a transação será revertida.

```sql
BEGIN TRANSACTION;

INSERT INTO 
    EMPRESTIMOS (ID_CLIENTE, DATA_EMPRESTIMO, PRECO_TOTAL)
VALUES (1, GETDATE(), 250.00);

UPDATE LIVROS 
SET 
    ESTOQUE = ESTOQUE - 1 
WHERE 
    ID = 10;

COMMIT;
```

Se algo der errado e precisarmos desfazer as mudanças, usamos `ROLLBACK`:

```sql
ROLLBACK;
```

### Controle de Erros com Transactions

Podemos usar `TRY...CATCH` para capturar erros e reverter transações automaticamente:

```sql
BEGIN TRANSACTION;

BEGIN TRY
    INSERT INTO 
        EMPRESTIMOS (ID_CLIENTE, DATA_EMPRESTIMO, PRECO_TOTAL)
    VALUES (1, GETDATE(), 250.00);

    UPDATE LIVROS 
    SET 
        ESTOQUE = ESTOQUE - 1 
    WHERE 
        ID = 10;
    
    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Erro ao processar a transação!';
END CATCH;
```

---

## Conclusão

Nesta aula, aprendemos:

- O que são **Stored Procedures**, como criá-las, executá-las e removê-las.
- O que são **Views**, como elas podem simplificar consultas e melhorar a segurança dos dados.
- O que são **Transactions**, como elas garantem a integridade dos dados e como utilizá-las corretamente.
