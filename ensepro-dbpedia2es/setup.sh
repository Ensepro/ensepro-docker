#! /bin/bash

#download datasets
./dataset_download.sh

# remove any existing container and images
docker container stop "$ENSEPRO_PREFIX"dbpedia2es &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"dbpedia2es &>> logs.txt
docker image rm "$ENSEPRO_PREFIX"dbpedia2es &>> logs.txt

# build
docker build \
   -t "$ENSEPRO_PREFIX"dbpedia2es \
   --progress=plain \
   .
