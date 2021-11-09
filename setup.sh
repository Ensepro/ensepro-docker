#! /bin/bash

date > start.txt

export ENSEPRO_PREFIX="arh-"

declare -a arr=(
   "spotlight"
   "elasticsearch"
   "ensepro-dbpedia2es"
   "palavras" 
   "ensepro-similarity"
   "ensepro-core"
)

for i in "${arr[@]}"
do
   cd $i
   ./setup.sh
   ./run.sh
   cd ..
done

date > end.txt