---
sidebar_position: 1
tags: [Nginx, Linux, SSL]
---

# SSL

Como gerar certificados SSL com Let's encrypt.

:::warning[Atenção]

Tenha em mãos o seu domínio ou subdomínio pronto para uso.

:::

## Instalação

Realize a instalação do Certbot no Ubuntu ou Debian conforme instruções abaixo:

1. Atualize a lista de pacotes do seu OS.

    ```sh
    sudo apt update
    ```

2. Instale o Certbot.

    ```sh
    sudo apt install certbot python3-certbot-nginx
    ```

## Geração do certificado

Para realizar a geração do certificado SSL, siga os passos abaixo:

1. Realize a geração do certificado trocando a tag `{{ website-domain }}` pelo seu domínio:

    1. Nginx

        ```sh
        sudo certbot --nginx -d {{ website-domain }}
        ```

    2. Apache

        ```sh
        sudo certbot --apache -d {{ website-domain }}
        ```

2. Com seu certificado gerado, normalmente ele estará disponível nas pastas abaixo (Troque a tag `{{ website-domain }}` pelo seu domínio):
    1. Chave pública: `/etc/letsencrypt/live/{{ website-domain }}/fullchain.pem`
    2. Chave privada: `/etc/letsencrypt/live/{{ website-domain }}/privkey.pem`
