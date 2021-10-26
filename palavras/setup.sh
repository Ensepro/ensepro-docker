#! /bin/bash

# verbose command
# docker build -t palavras --progress=plain .

echo -n "building palavras image..."
docker build -t palavras .
echo "done"

echo -n "testing..."
./test.sh
echo "done"