#!/bin/bash

if [[ "$ENVIRONMENT" = "local" ]]; then
    celery -A app worker -l info
else
    LOG_LEVEL_DEFAULT="debug"
    LOG_LEVEL_INFO="info"
    LOG_LEVEL=${LOG_LEVEL:-$LOG_LEVEL_DEFAULT}

    celery -A app worker -l=$LOG_LEVEL_INFO -B
fi
