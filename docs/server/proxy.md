---
sidebar_position: 2
---

# Proxy reverso

Como instalar e configurar um proxy reverso com Nginx.

## Instalação

Para criar um proxy reverso, você precisará ter em sua máquina o Nginx. Para instalá-lo, basta seguir os passos abaixo:

1. Atualize a lista de pacotes do seu OS.

    ```sh
    sudo apt update
    ```

2. Instale o Nginx

    ```sh
    sudo apt install nginx
    ```

3. Inicie o serviço do Nginx

    ```sh
    sudo systemctl start nginx
    ```

4. Habilite o Nginx para iniciar automaticamente na inicialização do sistema:

    ```sh
    sudo systemctl enable nginx
    ```

5. Verifique o status do Nginx

    ```sh
    sudo systemctl status nginx
    ```

## Configuração

Para configurar um novo redirecionamento em seu proxy reverso, basta seguir os passos abaixo:

1. Acesse a pasta de configurações do Nginx

    ```sh
    cd /etc/nginx/sites-available
    ```

2. Edite ou crie o arquivo de configuração utilizando um editor de texto de sua preferência

    ```sh
    sudo nano {{ website-alias }}
    ```

3. Configure o proxy com as informações de seu site conforme modelo abaixo (Certificado SSL, Endereço etc.)

    ```conf
    server {
        listen {{ application-port }};
        server_name {{ website-alias }};

        location / {
            proxy_pass {{ application-address }};
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }

    server {
        listen 443 ssl;
        server_name {{ website-alias }};

        ssl_certificate /etc/letsencrypt/live/{{ website-alias }}/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/{{ website-alias }}/privkey.pem;

        location / {
            proxy_pass {{ application-address }};
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
    ```

4. Crie um link simbólico do arquivo de configuração para pasta `sites-enabled`

    ```sh
    ln -s /etc/nginx/sites-available/{{ website-alias }} /etc/nginx/sites-enabled/
    ```

5. Teste as configurações do Nginx para que tenha certeza que estão corretas

    ```sh
    sudo nginx -t
    ```

6. Reinicie o serviço do Nginx

    ```sh
    sudo systemctl restart nginx
    ```
