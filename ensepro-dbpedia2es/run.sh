#!/bin/bash

# stop and remove container before running
docker stop "$ENSEPRO_PREFIX"dbpedia2es &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"dbpedia2es &>> logs.txt

# run
docker run -t -d --name "$ENSEPRO_PREFIX"dbpedia2es --add-host=host.docker.internal:host-gateway "$ENSEPRO_PREFIX"dbpedia2es bash