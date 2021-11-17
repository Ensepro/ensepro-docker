#! /bin/bash

# remove any existing container and images
docker container stop "$ENSEPRO_PREFIX"ensepro &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"ensepro &>> logs.txt
docker image rm "$ENSEPRO_PREFIX"ensepro &>> logs.txt

# build
docker build \
   -t "$ENSEPRO_PREFIX"ensepro \
   --progress=plain \
   .