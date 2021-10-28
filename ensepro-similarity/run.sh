#! /bin/bash
docker container stop "$ENSEPRO_PREFIX"embeddings  &> /dev/null
docker container rm "$ENSEPRO_PREFIX"embeddings  &> /dev/null

docker run -t -d --name "$ENSEPRO_PREFIX"embeddings -p 8098:8098 "$ENSEPRO_PREFIX"embeddings bash

curl --location --request POST 'http://localhost:8098/word-embedding/vector/update' \
--header 'Content-Type: application/json' \
--header 'force-reload: true' \
--data-raw '{
    "vector": "'$FILE'",
    "glove": false,
    "binary": false,
    "lang": "por"
}'