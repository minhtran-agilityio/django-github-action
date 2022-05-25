#!/usr/bin/env bash
PORT=$1

if [ "$PORT" = "" ]; then
    PORT='8000'
fi

# Runs database migration if DB_MIGRATE flag is set
echo "Db Migrate: $DEBUG_DATABASE_MIGRATE"
if [[ "$DEBUG_DATABASE_MIGRATE" == "true" ]]; then
    bin/dj.sh makemigrations
    bin/dj.sh migrate
fi

bin/dj.sh runserver 0.0.0.0:$PORT
