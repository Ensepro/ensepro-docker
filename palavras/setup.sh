#! /bin/bash

# remove any existing container and images
docker container stop "$ENSEPRO_PREFIX"palavras &> /dev/null
docker container rm "$ENSEPRO_PREFIX"palavras &> /dev/null
docker image rm "$ENSEPRO_PREFIX"palavras &> /dev/null

# build
docker build \
   -t "$ENSEPRO_PREFIX"palavras \
   --progress=plain \
   .