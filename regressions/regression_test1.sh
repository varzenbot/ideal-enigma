#!/bin/bash

TEST_OUTPUT=$(go run ../main.go)
if [[ ${TEST_OUTPUT} = "He_ll_o,_ W_or_ld_!
Hello, World!" ]]
then
  exit 0
fi
exit 1
