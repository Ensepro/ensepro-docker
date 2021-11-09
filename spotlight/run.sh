#!/bin/bash

# stop and remove container before running
docker container stop "$ENSEPRO_PREFIX"spotlight &> /dev/null
docker container rm "$ENSEPRO_PREFIX"spotlight &> /dev/null

# run
docker run -tid --restart unless-stopped --name "$ENSEPRO_PREFIX"spotlight -p 2228:80 alencarrh/spotlight_pt:1.0 spotlight.sh