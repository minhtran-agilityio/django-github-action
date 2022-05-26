#!/usr/bin/env bash

if [ -z "$MIN_COVERAGE" ]; then
    MIN_COVERAGE=80
fi

echo "---> TARGET COVERAGE: ${MIN_COVERAGE}%"

coverage run --source='.' src/manage.py test src -v 2
coverage report -m

COVERAGE_RESULT=`coverage report | grep TOTAL | awk 'N=1 {print $NF}' | sed 's/%//g'`

# echo ::set-output name=coverage_result::$COVERAGE_RESULT


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
