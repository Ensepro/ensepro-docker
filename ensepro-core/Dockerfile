FROM ubuntu:18.04

ARG ENSEPRO_CORE="https://github.com/Ensepro/ensepro-core/archive/refs/heads/feat/v2-compatible-problems.zip"

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

RUN apt-get update \
 && apt-get -y install sudo vim unzip software-properties-common git jq \
 && apt-get -y install openjdk-8* \
 && apt-get -y install maven maven* \
 && add-apt-repository -y ppa:deadsnakes/ppa \
 && apt-get update \
 && apt-get -y install python3.7 python3-pip

ADD $ENSEPRO_CORE /ensepro-core.zip
ADD ag-setup.sh ag-setup.sh
ADD root/* /root/

RUN ./ag-setup.sh \
 && unzip ensepro-core.zip \
 && mkdir ensepro-core \
 && mkdir /root/resultados \
 && mv ensepro-core-feat-v2-compatible-problems/* /ensepro-core \
 && rm -rf ensepro-core-feat-v2-compatible-problems \
 && rm ensepro-core.zip \
 && rm ag-setup.sh

RUN python3.7 -m pip install --upgrade pip \
 && python3.7 -m pip install Cython \
 && python3.7 -m pip install h5py \
 && python3.7 -m pip install -r /ensepro-core/requirements.txt \
 && echo "import nltk\nnltk.download('wordnet')\nnltk.download('omw')" | python3.7