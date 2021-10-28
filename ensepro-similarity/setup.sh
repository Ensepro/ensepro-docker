#! /bin/bash

export TYPE="fasttext"
export FILE="cbow_s50.zip"

docker container stop "$ENSEPRO_PREFIX"embeddings
docker container rm "$ENSEPRO_PREFIX"embeddings

docker image rm "$ENSEPRO_PREFIX"embeddings
docker build \
   -t "$ENSEPRO_PREFIX"embeddings \
  --build-arg FILE=$FILE \
  --build-arg TYPE=$TYPE \
  --progress=plain \
  .
