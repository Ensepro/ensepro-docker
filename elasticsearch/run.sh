#! /bin/bash

# stop and remove container before running
docker container stop "$ENSEPRO_PREFIX"elasticsearch &> /dev/null
docker container rm "$ENSEPRO_PREFIX"elasticsearch &> /dev/null
docker network rm "$ENSEPRO_PREFIX"network &> /dev/null

# run 
docker network create "$ENSEPRO_PREFIX"network
docker run \
    -d \
    --name "$ENSEPRO_PREFIX"elasticsearch \
    --net "$ENSEPRO_PREFIX"network \
    -p 9200:9200 \
    -p 9300:9300 \
    -e "discovery.type=single-node" \
    elasticsearch:7.9.0