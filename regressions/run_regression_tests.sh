#!/bin/bash

TESTS="1"

for TEST in ${TESTS}
do
  (if [[ -f "regression_test${TEST}.sh" ]]
  then
    if ! ./"regression_test${TEST}.sh"
    then
      echo "FAILED regression_test${TEST}"
      exit 1
    fi
  fi)
done