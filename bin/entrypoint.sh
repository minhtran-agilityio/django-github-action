#!/bin/bash

set -e
cmd="$@"

postgres_ready() {
python << END
import sys
import os
import psycopg2
try:
    conn = psycopg2.connect(
        dbname=os.getenv("DATABASE_NAME"),
        user=os.getenv("DATABASE_USER"),
        password=os.getenv("DATABASE_PASSWORD"),
        host=os.getenv("DATABASE_HOST"))

except psycopg2.OperationalError:
    sys.exit(-1)
sys.exit(0)
END
}

if [ "$DATABASE_ENGINE" == "django.db.backends.postgresql" ] && [ "$ENVIRONMENT" == "local" ]; then
    # Waits for postgres server to go up
    until postgres_ready; do
    >&2 echo "Postgres is unavailable - sleeping - $DATABASE_HOST"
    sleep 2
    done
fi

# Reset database migration if RESET_DATABASE flag is set
echo "Reset Database: $RESET_DATABASE"
if [[ "$RESET_DATABASE" == "true" ]]; then
    ./bin/dj-reset-db.sh
fi

# Runs database migration if DB_MIGRATE flag is set
echo "Db Migrate: $DATABASE_MIGRATE"
if [[ "$DATABASE_MIGRATE" == "true" ]]; then
    ./bin/dj-makemigrations.sh
    ./bin/dj-migrate.sh
fi

# Loads test data if GENERATE_SAMPLE_DATA is turned on
echo "Generate Sample Data: $GENERATE_SAMPLE_DATA"
if [[ "$GENERATE_SAMPLE_DATA" == "true" ]]; then
    ./bin/dj-initdata.sh
fi

echo "Collect statics: $COLLECT_STATICS"
if [[ "$COLLECT_STATICS" == "true" ]]; then
    ./bin/dj-collectstatics.sh
fi

echo "All ready"

exec $cmd
