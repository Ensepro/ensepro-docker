#!/bin/bash
docker stop "$ENSEPRO_PREFIX"palavras &> /dev/null
docker container rm "$ENSEPRO_PREFIX"palavras &> /dev/null
docker run -t -d --name "$ENSEPRO_PREFIX"palavras "$ENSEPRO_PREFIX"palavras sh