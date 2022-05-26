#!/usr/bin/env bash

MIN_COVERAGE=200

# if [ -z "$TEST_APP" ]; then
#     coverage run --source='.' src/manage.py test src -v 2 && coverage html
# else
#     coverage erase && coverage run --source='.' src/manage.py test "src/${TEST_APP}/tests/" -v 2 && coverage html
# fi

coverage erase && coverage run --source='.' src/manage.py test "src/${TEST_APP}/tests/" -v 2 && coverage html

coverage report -m

COVERAGE_RESULT=`coverage report | grep TOTAL | awk 'N=1 {print $NF}' | sed 's/%//g'`

# echo ::set-output name=coverage_result::$COVERAGE_RESULT


if [[ $COVERAGE_RESULT -gt $MIN_COVERAGE ]]; then
    echo ::set-output name=coverage_result::$COVERAGE_RESULT
else
    echo "#################################################"
    echo "Code coverage below allowed threshold ($COVERAGE_RESULT<$MIN_COVERAGE)"
    exit 1
fi

echo "#################################################"
echo "Completed!"
