#! /bin/bash

# remove any existing container and images
docker container stop "$ENSEPRO_PREFIX"embeddings &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"embeddings &>> logs.txt
docker image rm "$ENSEPRO_PREFIX"embeddings &>> logs.txt

export TYPE="fasttext"
export FILE="cbow_s50.zip"

# build
docker build \
   -t "$ENSEPRO_PREFIX"embeddings \
  --build-arg FILE=$FILE \
  --build-arg TYPE=$TYPE \
  --progress=plain \
  .