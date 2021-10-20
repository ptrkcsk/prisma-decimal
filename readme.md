Steps to reproduce:

1. Start Docker:
	```sh
	docker compose up
	```
2. Initialize database:
	```sh
	npx prisma migrate dev
	```
3. Run main script:
	```sh
	npm run main
	```
