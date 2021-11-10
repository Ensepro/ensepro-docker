#! /bin/bash

# remove any existing container and images
docker container stop "$ENSEPRO_PREFIX"palavras &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"palavras &>> logs.txt
docker image rm "$ENSEPRO_PREFIX"palavras &>> logs.txt

# build
docker build \
   -t "$ENSEPRO_PREFIX"palavras \
   --progress=plain \
   .