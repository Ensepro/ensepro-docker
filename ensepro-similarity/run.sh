#! /bin/bash

export TYPE="fasttext"
export FILE="cbow_s50.zip"

# stop and remove container before running
docker container stop "$ENSEPRO_PREFIX"embeddings  &> /dev/null
docker container rm "$ENSEPRO_PREFIX"embeddings  &> /dev/null

# run
docker run -t -d --name "$ENSEPRO_PREFIX"embeddings -p 8098:8098 "$ENSEPRO_PREFIX"embeddings bash

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