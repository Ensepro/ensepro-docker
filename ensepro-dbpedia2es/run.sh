#!/bin/bash

# stop and remove container before running
docker stop "$ENSEPRO_PREFIX"dbpedia2es &> /dev/null
docker container rm "$ENSEPRO_PREFIX"dbpedia2es &> /dev/null

# run
docker run -t -d --name "$ENSEPRO_PREFIX"dbpedia2es "$ENSEPRO_PREFIX"dbpedia2es bash