# Docs

<div align="center">
    <img alt="Logo" width="350px" src="https://i.imgur.com/JKxINuG.jpeg" />

![Status](http://img.shields.io/static/v1?label=STATUS&message=FINALIZADO&color=RED&style=for-the-badge)

![Top language](https://img.shields.io/github/languages/top/felipesilva15/docs.svg)
![Language count](https://img.shields.io/github/languages/count/felipesilva15/docs.svg)
![Repository size](https://img.shields.io/github/repo-size/felipesilva15/docs.svg)
[![Last commit](https://img.shields.io/github/last-commit/felipesilva15/docs.svg)](https://github.com/felipesilva15/docs/commits/main)
[![Issues](https://img.shields.io/github/issues/felipesilva15/docs.svg)](https://github.com/felipesilva15/docs/issues)
[![Licence](https://img.shields.io/github/license/felipesilva15/docs.svg)](https://github.com/felipesilva15/docs/blob/main/LICENSE)

</div>

Este é um website estático gerado a partir arquivos markdown (`.md`) construído com [Docusaurus](https://docusaurus.io/).

Ele foi criado para documentar processos e procedimentos técnicos, tanto para uso próprio quanto para compartilhar conhecimento com outros desenvolvedores. Através desta plataforma, organizo e centralizo informações valiosas que podem ser facilmente esquecidas ou difíceis de encontrar.

## 📑 Sumário

- [Descrição geral](#-descrição-geral)
- [Principais funcionalidades](#-principais-funcionalidades)
- [Screenshots](#-screenshots)
- [Tecnologias utilizadas](#%EF%B8%8F-tecnologias-utilizadas)
- [Estrutura de pastas](#-estrutura-de-pastas)
- [Executando localmente](#-executando-localmente)
- [Executando com Docker](#-executando-com-docker)
- [Autores](#%EF%B8%8F-autores)
- [Licença](#-licença)

## 📘 Descrição Geral

- **Versão:** 1.0.0  
- **Autor:** [Felipe Silva](mailto:felipe.allware@gmail.com)  
- **Licença:** [Licença](https://github.com/felipesilva15/docs/blob/main/LICENSE)
- **Deploy:** [Site](https://docs.felipesilva15.com.br)

## ⚙ Principais funcionalidades

- Documentações de tópicos da área de TI como programação, servidor/cloud, ferramentas, aulas etc.
- Tema claro e escuro

## 📷 Screenshots

Abaixo são apenas algumas capturas de tela da aplicação.

![Homepage](https://i.imgur.com/PMrgNr5.jpeg)
*Homepage*

![Introdução](https://i.imgur.com/7j4dgA1.jpeg)
*Introdução*

## 🛠️ Tecnologias utilizadas

- **React 18**
- **Docusaurus**
- **Docker**
- **GitHub Actions (CI/CD)**

## 📁 Estrutura de pastas

Veja abaixo uma breve explicação da estrutura de pastas utilizadas neste projeto.

```text
.
├── docs/
│   ├── classroom/                  # Seção de documentação de aulas em Markdown
│   ├── programming/                # Seção de documentação de programação em Markdown
│   ├── server/                     # Seção de documentação de servidor/cloud em Markdown
│   ├── tools/                      # Seção de documentação de ferramentas em Markdown
│   └── intro.md                    # Arquivo de documentação inicial em Markdown
├── src/
│    ├── components/                # Componentes reutilizáveis
│    ├── css/                       # Estilos globais e variáveis SCSS
│    └── pages/                     # Páginas da aplicação
├── static/
│   └── img/                        # Imagens estáticas (temas, logos, mockups)  
├── docusaurus.config.ts            # Configurações gerais da aplicação
└── sidebars.ts                     # Configuração de sidebars de navegação das seções
```

## 🚀 Executando localmente

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

### 📋 Pré-requisitos

- npm ou yarn

### 🔧 Instalação

1. Clone o projeto utilizando o comando abaixo

    ``` bash
    git clone https://github.com/felipesilva15/docs.git
    ```

2. Acesse a pasta dos fonts deste projeto

    ```bash
    cd docs
    ```

3. Instale as dependências do projeto

    ```bash
    npm install
    ```

4. Inicie a aplicação

    ```bash
    npm start
    ```

5. Acesse a aplicação em <http://localhost:3000>.

## 🐳 Executando com Docker

```bash
# Build da imagem
docker build -t felipesilva15/docs:latest .

# Execução do container
docker run -d -p 8081:80 felipesilva15/docs
```

Após completar a execução, basta acessar a aplicação em <http://localhost:8081>.

## ✒️ Autores

- **Felipe Silva** - *Desenvolvedor e mentor* - [felipesilva15](https://github.com/felipesilva15)

## 📄 Licença

Este projeto está sob a licença (MIT) - veja o arquivo [LICENSE](https://github.com/felipesilva15/docs/blob/main/LICENSE) para detalhes.

---

Documentado por [Felipe Silva](https://github.com/felipesilva15) 😊
