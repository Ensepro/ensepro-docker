#! /bin/bash

DATASET_FOLDER="datasets"
DBPEDIA_DATASET_LIST="../datasets.txt"
DBPEDIA_DATASET_LOCK="dbpediadatasetlock"
DBPEDIA_DATASET_BASE_URL="http://downloads.dbpedia.org/2016-10/core-i18n/pt/"
DOWNLOAD_DATASET=true
if [ ! -f $DBPEDIA_DATASET_LOCK ]; then
    echo -n "Downloading datasets... "
    touch $DBPEDIA_DATASET_LOCK
    date > $DBPEDIA_DATASET_LOCK
else
    DOWNLOAD_DATASET=false
    echo -n "Datasets already downloaded... "
fi


if [ $DOWNLOAD_DATASET = true ]; then
    rm -rf $DATASET_FOLDER
    mkdir $DATASET_FOLDER
    cd $DATASET_FOLDER
    xargs -P 5 -n 1 curl -O < $DBPEDIA_DATASET_LIST &> /dev/null
    cd ..
fi
echo "done"