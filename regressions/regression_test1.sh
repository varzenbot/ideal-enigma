#!/bin/bash

TEST_OUTPUT=$(go run ../main.go)
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  exit 0
fi
exit 1
