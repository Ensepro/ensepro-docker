#! /bin/bash

# verbose command
# docker build -t palavras --progress=plain .

echo -n "building palavras image..."
docker build -t palavras .
echo "done"

echo "testing..."
./test.sh
echo "\ndone"