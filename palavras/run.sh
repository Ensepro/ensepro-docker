#!/bin/bash
docker stop palavras &> /dev/null
docker container rm palavras &> /dev/null
docker run -t -d --name palavras palavras bash