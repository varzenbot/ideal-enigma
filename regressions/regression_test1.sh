#!/bin/bash

TEST_OUTPUT=$(curl -s -X GET localhost:${PORTNR})
if [[ ${TEST_OUTPUT} = "Hello, Web!" ]]
then
  echo "PASSED $(basename $0)!"
  exit 0
fi
echo "ERROR: we got ->  \"${TEST_OUTPUT}\""
exit 1
