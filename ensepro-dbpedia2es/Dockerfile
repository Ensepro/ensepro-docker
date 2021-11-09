FROM python:3.7.9-slim


ARG ENSEPRO_DBPEDIA2ES="https://github.com/Ensepro/ensepro-dbpedia-dataset-to-elasticsearch/archive/refs/heads/master.zip"

# base settings for system
RUN apt-get update \
 && apt-get -y install unzip curl bzip2

ADD ./datasets/* /datasets/
ADD $ENSEPRO_DBPEDIA2ES /ensepro-dbpedia2es.zip

RUN bzip2 -d /datasets/*.bz2

RUN unzip ensepro-dbpedia2es.zip \
 && mkdir ensepro-dbpedia2es \
 && mv ensepro-dbpedia-dataset-to-elasticsearch-master/* /ensepro-dbpedia2es \
 && rm -rf ensepro-dbpedia-dataset-to-elasticsearch-master \
 && rm ensepro-dbpedia2es.zip


RUN python3.7 -m pip install --upgrade pip \
  && python3.7 -m pip install -r /ensepro-dbpedia2es/requirements.txt


WORKDIR /ensepro-dbpedia2es/main