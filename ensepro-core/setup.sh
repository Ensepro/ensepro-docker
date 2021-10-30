#! /bin/bash

# remove any existing container and images
docker container stop "$ENSEPRO_PREFIX"ensepro &> /dev/null
docker container rm "$ENSEPRO_PREFIX"ensepro &> /dev/null
docker image rm "$ENSEPRO_PREFIX"ensepro &> /dev/null

# build
docker build \
   -t "$ENSEPRO_PREFIX"ensepro \
   --progress=plain \
   .