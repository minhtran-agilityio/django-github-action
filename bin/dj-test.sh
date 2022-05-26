#!/usr/bin/env bash

if [ -z "$TEST_APP" ]; then
    coverage run --source='.' src/manage.py test src -v 2 && coverage html
else
    coverage erase && coverage run --source='.' src/manage.py test "src/${TEST_APP}/tests/" -v 2 && coverage html
fi

coverage report -m

COVERAGE_RESULT=`coverage report | grep TOTAL | awk 'N=1 {print $NF}' | sed 's/%//g'`

echo ::set-output name=coverage_result::$COVERAGE_RESULT
