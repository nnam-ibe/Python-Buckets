make-migrations:
	python ./backend/manage.py makemigrations

migrate:
	python ./backend/manage.py migrate

db-login:
	PGPASSWORD=$(BUCKETS_DB_PASS) psql -U $(BUCKETS_DB_USER) -h $(BUCKETS_DB_HOST) $(BUCKETS_DB_NAME) --port $(BUCKETS_DB_PORT)

run-server:
	python ./backend/manage.py runserver

run-tests:
	python ./backend/manage.py test ./backend
