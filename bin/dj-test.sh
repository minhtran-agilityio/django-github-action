#!/usr/bin/env bash

# Set default min coverage percentage if not exist
if [ -z "$MIN_COVERAGE" ]; then
    MIN_COVERAGE=80
fi

coverage run --source='.' src/manage.py test src -v 2
coverage report -m

COVERAGE_RESULT=`coverage report | grep TOTAL | awk 'N=1 {print $NF}' | sed 's/%//g'`

if [[ $COVERAGE_RESULT -gt $MIN_COVERAGE ]]; then
    echo "--------------------------------------------------------------------"
    echo ::set-output name=coverage_result::$COVERAGE_RESULT
    echo "--------------------------------------------------------------------"
else
    echo "--------------------------------------------------------------------"
    echo "Code coverage below allowed threshold ($COVERAGE_RESULT<$MIN_COVERAGE)"
    echo "--------------------------------------------------------------------"
    exit 1
fi

echo "Completed!"
