#!/bin/bash

# stop and remove container before running
docker stop "$ENSEPRO_PREFIX"palavras &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"palavras &>> logs.txt

# run
docker run -d --name "$ENSEPRO_PREFIX"palavras -p 8099:8099 "$ENSEPRO_PREFIX"palavras bash