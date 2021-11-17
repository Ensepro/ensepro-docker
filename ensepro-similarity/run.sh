#! /bin/bash

export FILE="cbow_s50.txt"

# stop and remove container before running
docker container stop "$ENSEPRO_PREFIX"embeddings  &>> logs.txt
docker container rm "$ENSEPRO_PREFIX"embeddings  &>> logs.txt

# run
docker run -d --name "$ENSEPRO_PREFIX"embeddings -p 8098:8098 "$ENSEPRO_PREFIX"embeddings bash

sleep 10

# set embedding vector
curl --location --request POST 'http://localhost:8098/word-embedding/vector/update' \
--header 'Content-Type: application/json' \
--header 'force-reload: true' \
--data-raw '{
    "vector": "'$FILE'",
    "glove": false,
    "binary": false,
    "lang": "por"
}'