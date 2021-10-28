#! /bin/bash

export ENSEPRO_PREFIX="arh-"

declare -a arr=(
   "palavras" 
   "ensepro-similarity"
)

for i in "${arr[@]}"
do
   cd $i
   ./setup.sh
   ./run.sh
   cd ..
done