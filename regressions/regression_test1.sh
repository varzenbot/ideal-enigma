#!/bin/bash

TEST_OUTPUT=$(curl -s -X GET localhost:27016)
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  exit 0
fi
exit 1
