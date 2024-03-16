#!/bin/bash

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."
    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done
    echo "PostgreSQL started"
fi
sleep 20
python hello_django/manage.py flush --no-input
python hello_django/manage.py migrate
python hello_django/manage.py runserver 0.0.0.0:8000
exec "$@"