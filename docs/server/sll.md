---
sidebar_position: 1
---

# SSL

Como criar e configurar certificados SSL com Let's encrypt.

:::warning[Atenção]

Tenha em mãos o seu domínio ou subdomínio pronto para uso.

:::

## Instalação

Realize a instalação do Certbot.

## Geração do certificado

Para realizar a geração do certificado SSL, siga os passos abaixo:

1. Realize a geração do certificado trocando a tag `{{ website-domain }}` pelo seu domínio:

    ```sh
    sudo certbot --nginx -d {{ website-domain }}
    ```

2. Com seu certificado pronto, normalmente ele ficará disponível nas pastas abaixo (Troque a tag `{{ website-domain }}` pelo seu domínio):
    1. Chave pública: `/etc/letsencrypt/live/{{ website-domain }}/fullchain.pem`
    2. Chave privada: `/etc/letsencrypt/live/{{ website-domain }}/privkey.pem`
