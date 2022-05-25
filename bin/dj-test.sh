#!/usr/bin/env bash

if [ -z "$TEST_APP" ]; then
    coverage run --source='.' src/manage.py test src -v 2 && coverage html
else
    coverage erase && coverage run --source='.' src/manage.py test "src/${TEST_APP}/tests/" -v 2 && coverage html
fi

coverage report -m
