#!/bin/bash

TEST_OUTPUT=$(curl -s -X GET localhost:8080)
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  echo "PASSED $(basename $0)!"
  exit 0
fi
echo "ERROR: we got ->  \"${TEST_OUTPUT}\""
exit 1
