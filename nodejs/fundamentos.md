- Conteúdo técnico
	- Microsserviços: Uma aplicação onde as suas funcionalidades são separadas em projetos menores que, apesar de interligados, são independentes.
	- O diferencial do NestJS
		- Framework opinado
		- Integrações com ferramentas muito utilizadas no mercado (Ex.: Prisma)
		- ypeScript & Decorators
- Conteúdo prático
	- Criação do projeto em NestJS (Base)
		- Modules, Services e Controllers
		- Inversão e injeção de dependências 
	- Setup do Prisma
		- dentro do arquivo `prisma/schema.prisma` é feita a criação das tabelas
		- com o comando `npx prisma migrate dev` é feita a criação da migração para o db
		- criação do arquivo `src/prisma.service.ts`, seguindo a [documentação](https://docs.nestjs.com/recipes/prisma), para fazer a conexão com o NestJS
	- Requisições
	```ts
    @Post()
        async create(@Body() body: CreateNotificationBody) {
            const { recipient_id, content, category } = body;
            await this.prisma.notifications.create({
                data: {
                    id: randomUUID(),
                    content,
                    category,
                    recipient_id,
                },
            });
        }
    ```
