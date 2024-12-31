#!/bin/bash

TEST_OUTPUT=$(go run ../main.go)
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  return 0
fi
echo "FAILED regression_test1"
return 1
