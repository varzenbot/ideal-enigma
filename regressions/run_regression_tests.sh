#!/bin/bash

TESTS="1"

# start the server
go run ../main.go &

# wait for the server to start

typeset TIMEOUT=30

while ! lsof -i :27016
do
  echo "warning: server is not running on port 27016 - timeout in ${TIMEOUT} sec"
  sleep 1
  TIMEOUT=$((TIMEOUT-1))
  if [[ ${TIMEOUT} -eq 0 ]]
  then
    echo "error: server did not start after 30 sec"
    kill %1
    exit 1
  fi
done

for TEST in ${TESTS}
do
  echo "Running regression_test${TEST}"
  if [[ -f "regression_test${TEST}.sh" ]]
  then
    if ! "./regression_test${TEST}.sh"
    then
      echo "FAILED regression_test${TEST}"
      kill %1
      exit 1
    fi
    echo "PASSED regression_test${TEST}"
  fi
done

# stop the server
kill %1

exit 0