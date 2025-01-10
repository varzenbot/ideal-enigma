#!/bin/bash

# check that the server is bound to port 27016
if ! lsof -i :27016
then
  echo "ERROR: server is not running on port 27016"
  exit 1
fi

TEST_OUTPUT=$(curl -s -X GET localhost:27016)
if [[ ${TEST_OUTPUT} = "Hello, World!" ]]
then
  echo "PASSED $(basename $0)!"
  exit 0
fi
echo "ERROR: we got ->  \"${TEST_OUTPUT}\""
exit 1
