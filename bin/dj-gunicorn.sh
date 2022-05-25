#!/bin/bash

if [[ "$PORT" = "" ]]; then
  PORT='8000'
fi

if [[ "${GUNICORN_NUM_WORKERS}" = "" ]]; then
    GUNICORN_NUM_WORKERS=1
fi

if [[ "${GUNICORN_LOG_LEVEL}" = "" ]]; then
    GUNICORN_LOG_LEVEL=debug
fi

if [[ "${GUNICORN_MAX_REQUESTS}" = "" ]]; then
    GUNICORN_MAX_REQUESTS=0
fi

if [[ "${GUNICORN_MAX_TIMEOUT}" = "" ]]; then
    GUNICORN_MAX_TIMEOUT=120
fi

gunicorn \
    --bind 0.0.0.0:${PORT} \
    --max-requests ${GUNICORN_MAX_REQUESTS} \
    --workers ${GUNICORN_NUM_WORKERS} \
    --threads ${GUNICORN_NUM_WORKERS} \
    --worker-class=gthread \
    --log-level ${GUNICORN_LOG_LEVEL} \
    --timeout ${GUNICORN_MAX_TIMEOUT} \
    --chdir src \
    app.wsgi