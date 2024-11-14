---
sidebar_position: 1
tags: [PHP, Laravel, JWT, Auth]
---

# Autenticação JWT

Como instalar e configurar a autenticação com token JWT em uma API Laravel.

:::warning[Atenção]

Você irá precisar que o Composer esteja instalado em seu computador.

:::

## Instalação

Para realizar uma autenticação com tokens JWT em sua API, podemos utilizar a biblioteca [tymon/jwt-auth](https://jwt-auth.readthedocs.io/en/develop/laravel-installation/).

1. Instale a biblioteca.

    ```sh
    composer require tymon/jwt-auth
    ```

2. Publique os pacotes de configuração.

    ```sh
    php artisan vendor:publish --provider="Tymon\JWTAuth\Providers\LaravelServiceProvider"
    ```

3. Gere a chave secreta.

    ```sh
    php artisan jwt:secret
    ```

## Configuração

Para implementar a autenticação com tokens JWT, basta seguir os passos abaixo.

1. Defina as variáveis de ambiente no arquivo `.env`.

    ```text
    JWT_TTL=60              # Tempo de expiração (Minutos)
    JWT_REFRESH_TTL=20160   # Tempo de expiração para atualização (Minutos)
    ```

2. Configure o guard de autenticação acessando o arquivo `config/auth.php`.

    ```php
    'defaults' => [
        'guard' => 'api',
        'passwords' => 'users',
    ]

    ...

    'guards' => [
        'api' => [
            'driver' => 'jwt',
            'provider' => '{{ Sua tabela de usuários }}',
        ],
    ]
    ```

3. Configure sua model de usuários (Normalmente é utizada a model `User`) e cole os métodos abaixo.

    ```php
    public function getJWTIdentifier() {
        return $this->getKey();
    }

    public function getJWTCustomClaims() {
        return [];
    }

    public function getAuthPassword() {
        return $this->{{ Seu campo de senha }};
    }
    ```

4. Crie uma controller para a autenticação.

    ```sh
    php artisan make:controller AuthController
    ```

5. Implemente os métodos de autenticação na controller criada.

    ```php
    public function login(Request $request) {
        $credentials = [
            '{{ Seu campo de login }}' => $request->{{ Seu campo de login }}, // Campo personalizado para o login
            'password' =>$request->{{ Seu campo de senha }}, // Campo padrão para a senha
        ];

        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(["message" => "Credenciais inválidas."], 401);
        }

        return $this->respondWithToken($token);
    }
    
    public function me() {
        return response()->json(auth()->user());
    }
    
    public function logout() {
        auth()->logout();

        return response()->json(['message' => 'Logout efetuado com sucesso!']);
    }
    
    public function refresh() {
        return $this->respondWithToken(auth()->refresh());
    }

    protected function respondWithToken($token) {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }
    ```

6. Crie as rotas de autenticação e rotas protegidas através do arquivo `routes\api.php`.

    ```php
    use App\Http\Controllers\AuthController;
    use Illuminate\Support\Facades\Route;

    Route::post('/login', [AuthController::class, 'login']);

    Route::group(['middleware' => 'auth:api'], function () {
        // Rotas que requerem autenticação
        Route::post('/logout', [AuthController::class, 'logout']);
        Route::post('/refresh-token', [AuthController::class, 'refresh']);
        Route::get('/me', [AuthController::class, 'me']);
    });
    ```
