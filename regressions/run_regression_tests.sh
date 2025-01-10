#!/bin/bash

TESTS="1"

# start the server
go run ../main.go &

for TEST in ${TESTS}
do
  echo "Running regression_test${TEST}"
  (if [[ -f "regression_test${TEST}.sh" ]]
  then
    if ! ./regression_test${TEST}.sh
    then
      echo "FAILED regression_test${TEST}"
      exit 1
    fi
    echo "PASSED regression_test${TEST}"
  fi)
done

# stop the server
kill %1

exit 0