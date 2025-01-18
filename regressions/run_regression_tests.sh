#!/bin/bash

TESTS=$(ls regression_test*.sh 2>/dev/null)

function cleanup {
  pkill -9 "hello_web"
  wait ${SERVER_PID}
  exit $1
}

# start the server
go build -o ../hello_web ../main.go
../hello_web &
SERVER_PID=$!

# wait for the server to start

typeset TIMEOUT=30
export PORTNR=8080

while ! lsof -i :${PORTNR}
do
  echo "warning: server is not running on port ${PORTNR} - timeout in ${TIMEOUT} sec"
  sleep 1
  TIMEOUT=$((TIMEOUT-1))
  if [[ ${TIMEOUT} -eq 0 ]]
  then
    echo "error: server did not start after 30 sec"
    cleanup 1
  fi
done

for TEST in ${TESTS}
do
  echo "Running ${TEST}"
  if [[ -f "${TEST}" ]]
  then
    if ! "./${TEST}"
    then
      echo "FAILED ${TEST}"
      cleanup 1
    fi
    echo "PASSED ${TEST}"
  fi
done

# stop the server
cleanup 0
