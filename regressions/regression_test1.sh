#!/bin/bash

TEST_OUTPUT=$(curl -s -X GET localhost:27016)
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  exit 0
fi
echo "ERROR: we got ->  \"${TEST_OUTPUT}\""
exit 1
