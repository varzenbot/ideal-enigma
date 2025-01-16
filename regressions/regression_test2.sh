#!/bin/bash

echo "Testing windows functionality"

TEST_OUTPUT=$(curl -s -X GET localhost:8080/windows?name=World)
if [[ ${TEST_OUTPUT} = "Hello, World, !" ]]
then
  echo "PASSED $(basename "$0")!"
  exit 0
else
    echo "ERROR: we got ->  \"${TEST_OUTPUT}\""
fi

TEST_OUTPUT=$(curl -s -X GET localhost:8080/windows?name=World\&field=value)
if [[ ${TEST_OUTPUT} = "Hello, World, value, !" ]]
then
  echo "PASSED $(basename "$0")!"
  exit 0
else
    echo "ERROR: we got ->  \"${TEST_OUTPUT}\""
fi

exit 1
