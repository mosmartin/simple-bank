postgres:
	docker run -d --rm \
                --name postgres \
                -p 5432:5432 \
                -e POSTGRES_USER=root \
                -e POSTGRES_PASSWORD=  \
                -e PGDATA=/var/lib/postgresql/data/pgdata \
                -v /Users/martinmacharia/data/postgres:/var/lib/postgresql/data \
                postgres:14-alpine

createdb:
	docker exec -it postgres createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres dropdb --username=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:sqladmin@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:sqladmin@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: all