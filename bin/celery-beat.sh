#!/bin/bash

echo "Remove celery temp files"
rm ../celerybeat-schedule > /dev/null 2>&1
rm ../celerybeat.pid > /dev/null 2>&1

celery -A app beat -l info
