#! /bin/bash

# stop and remove container before running
docker stop "$ENSEPRO_PREFIX"ensepro &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"ensepro &>> logs.txt

# run
docker run -t -d --name "$ENSEPRO_PREFIX"ensepro "$ENSEPRO_PREFIX"ensepro bash