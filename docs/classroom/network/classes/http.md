---
sidebar_position: 1
tags: [HTTP]
---

# Comunicação HTTP

## Visão Geral da Comunicação HTTP

A comunicação HTTP (Hypertext Transfer Protocol) é um modelo de comunicação baseado no paradigma **requisição-resposta**. Ou seja, um **cliente** envia uma requisição para um **servidor**, que processa a solicitação e responde com os dados correspondentes.

Diferente da comunicação baseada em eventos ou WebSockets, onde a conexão pode permanecer aberta para envio contínuo de dados, o HTTP trata cada requisição de forma independente, sem manter uma conexão persistente por padrão.

![Diagrama de Comunicação HTTP](/img/http-diagram.png)

---

## O Papel do Client

O cliente (geralmente um navegador ou aplicação) é responsável por iniciar a comunicação, enviando requisições para o servidor e esperando respostas. Exemplos de clientes:

- Navegadores (Chrome, Firefox, Edge, etc.)
- Aplicações mobile
- Postman
- Aplicações desktop
- APIs consumidas por outros sistemas

---

## O que é e o que contém uma Request?

Uma requisição HTTP é como o envio de uma **carta** ou **pacote** pelos Correios. Assim como uma carta precisa ter um envelope, um destinatário e um conteúdo, uma requisição HTTP também segue uma estrutura organizada:

- **Método HTTP**: Define a ação desejada (ex: `GET`, `POST`)
- **URL**: Endereço para onde a requisição será enviada
- **Cabeçalhos (Headers)**: Informações adicionais sobre a requisição (ex: tipo de conteúdo, autenticação, etc.)
- **Corpo (Body)**: Dados enviados na requisição (usado principalmente em `POST`, `PUT`, etc.)

Exemplo de requisição HTTP (cURL):

```curl
GET /usuarios HTTP/1.1
Host: api.exemplo.com
Authorization: Bearer <token>
Accept: application/json
```

---

## Como é estruturada uma URL?

Uma URL (Uniform Resource Locator) é composta por várias partes que definem o endereço e o caminho da requisição. Veja abaixo uma imagem ilustrativa sobre a composição da URL:

![Composição de uma URL](/img/url-composition.png)

---

## Métodos HTTP

Os métodos HTTP definem a ação da requisição. Os mais comuns são:

- **GET**: Solicita informações
- **POST**: Envia dados para criação
- **PUT**: Atualiza um recurso existente
- **DELETE**: Remove um recurso
- **PATCH**: Atualiza parcialmente um recurso

---

## O Papel do Server

O servidor recebe as requisições do cliente, processa as informações e retorna uma resposta. Ele pode realizar tarefas como:

- Consultar um banco de dados
- Validar credenciais de autenticação
- Retornar arquivos estáticos

---

## O que é e o que contém um Response?

A resposta HTTP segue uma estrutura similar à requisição e contém:

- **Código de status**: Indica o resultado da requisição (Veja mais sobre [HTTP Status codes](https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status)!)
- **Cabeçalhos**: Informações adicionais (ex: `Content-Type`)
- **Corpo (Body)**: Dados retornados ao cliente (geralmente em JSON ou HTML)

Exemplo de resposta HTTP:

```curl
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": 1,
  "nome": "Felipe",
  "idade": 25
}
```

---

## Dados obrigatórios e opcionais para fazer uma requisição

Alguns elementos são essenciais para uma requisição funcionar corretamente:

**Obrigatórios:**

- Método HTTP
- URL

**Opcionais:**

- Cabeçalhos (ex: `Authorization`, `Content-Type`)
- Corpo da requisição (em métodos como `POST`, `PUT`)

---

## Conclusão

A comunicação HTTP é a base da web moderna e do funcionamento das APIs. Entender como clientes e servidores interagem por meio de requisições e respostas é essencial para desenvolver aplicações robustas e eficientes. Com a compreensão dos métodos HTTP, estrutura das URLs, cabeçalhos e status codes, você estará mais preparado para construir e consumir serviços web de forma eficaz. Ferramentas como o **Postman** podem auxiliar na realização de testes e depuração de requisições HTTP.
