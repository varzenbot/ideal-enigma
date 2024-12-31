#!/bin/bash

TEST_OUTPUT=$(go run ../main.go | tr -d '\r')
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  exit 0
fi
echo "FAILED regression_test1"
exit 1
