### Estrutura de Pastas e Conteúdo

#### 1. `Presentation/`
Contém a lógica de interface com o usuário (UI) e a API, onde as requisições são recebidas e as respostas são enviadas.

- **controllers**: Controladores que lidam com a lógica de receber a entrada do usuário e retornar as respostas.
  - Exemplo: `UserController.ts`, `OrderController.ts`
  
- **middlewares**: Middlewares específicos para a camada de apresentação.
  - Exemplo: `ValidateUserInputMiddleware.ts`, `ErrorHandlingMiddleware.ts`
  
- **routes**: Definições de rotas específicas para a camada de apresentação.
  - Exemplo: `UserRoutes.ts`, `OrderRoutes.ts`

#### 2. `Application`
Contém a lógica de aplicação e coordena as operações entre as camadas de domínio e infraestrutura. 

- **useCases**: Contém a lógica de aplicação, onde a coordenação entre diferentes repositórios e outras partes do sistema ocorre.
  - Exemplo: `UserUseCase.ts`, `OrderUseCase.ts`

- **dtos**: Data Transfer Objects, usados para transferir dados entre as camadas da aplicação.
  - Exemplo: `UserDTO.ts`, `OrderDTO.ts`

#### 3. `Domain`
Contém a lógica central do negócio, sem depender de frameworks ou tecnologias específicas.

- **entities**: Representações das entidades de domínio, que são objetos que têm uma identidade distinta que persiste ao longo do tempo.
  - Exemplo: `User.ts`, `Order.ts`
  
- **repositories**: Interfaces dos repositórios que definem os métodos para acessar os dados das entidades.
  - Exemplo: `UserRepository.ts`, `OrderRepository.ts`
  
- **services**: Lógica de domínio complexa que não se encaixa nas entidades ou value objects.
  - Exemplo: `UserDomainService.ts`, `OrderDomainService.ts`

#### 4. `Infrastructure`
Contém a implementação de todos os detalhes de infraestrutura, como acesso a banco de dados, sistemas de mensagens, etc.

- **persistence**: Implementações concretas de repositórios, gerenciadores de transações, etc.
  - **prisma**: Configurações e instâncias do Prisma.
    - Exemplo: `PrismaClient.ts`
  - **repositories**: Implementações das interfaces de repositório definidas na camada de domínio.
    - Exemplo: `PrismaUserRepository.ts`, `PrismaOrderRepository.ts`

### Explicações Adicionais

- **presentation**: Foca na interface com o usuário ou cliente da API. Os controladores recebem as requisições HTTP, validam dados, invocam a lógica de aplicação e retornam as respostas apropriadas. Middlewares nesta camada podem lidar com autenticação, autorização, e tratamento de erros específicos de HTTP.

- **application**: Atua como a camada de coordenação e orquestração da aplicação. Aqui, você pode ter lógica de negócio que depende de múltiplos repositórios ou serviços, mas não diretamente da infraestrutura. Commands e queries são usados para separar claramente operações de escrita e leitura.
  
- **domain**: Representa o núcleo do seu sistema, onde reside a lógica mais importante. Esta camada deve ser a mais estável e a menos dependente de detalhes tecnológicos. As entidades são ricas em comportamento e encapsulam regras de negócio.

- **infrastructure**: Lida com a implementação de detalhes tecnológicos e externos, como a comunicação com o banco de dados, sistemas de mensageria, serviços externos, etc. Essa camada é responsável por realizar operações que dependem de tecnologia específica.

Essa organização ajuda a manter uma separação clara entre as diferentes responsabilidades na sua aplicação, facilitando a manutenção e a escalabilidade.