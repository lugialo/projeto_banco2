# Backend

## Descrição
Adicionar descrição

## Pré-requisitos
### Versões
Node.js - 20.11.1
<br>npm - 10.2.4
<br>MySQL - 8.0.30

## Instalação
1. **Clonar o repositório:**
<br>`git clone https://github.com/seu-usuario/seu-projeto.git`


2. **Instalar as dependências:**
<br>`cd backend`
<br>`npm install`

3. **Configurar o banco de dados:**
- Crie um banco de dados MySQL.
- Renomeie o arquivo `.env.example` para `.env` e configure as variáveis de ambiente relacionadas ao banco de dados (ex: `DATABASE_URL`).

4. **Executar as migrations do Prisma:**
<br>`npx prisma migrate dev`



## Uso

1. **Compilar o projeto:**
<br>`npm run build`

2. **Iniciar a aplicação:**
<br>`npm start`

## Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
