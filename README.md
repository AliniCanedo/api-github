## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas em seu sistema:

- Docker: [Link para instalação do Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Link para instalação do Docker Compose](https://docs.docker.com/compose/install/)

## Como executar o aplicativo

1. Clone este repositório em sua máquina local:

   ```bash
   git clone https://github.com/AliniCanedo/api-github.git
   cd api-github

2. Construa a imagem Docker e inicie os contêineres:

    docker-compose up [--build]

3. O aplicativo estará disponível em http://localhost:3000.

4. Para parar o aplicativo, pressione Ctrl + C no terminal e execute o seguinte comando:

    docker-compose down


