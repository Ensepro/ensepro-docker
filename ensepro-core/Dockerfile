FROM ubuntu:18.04

ARG ENSEPRO_CORE="https://github.com/Ensepro/ensepro-core/archive/refs/heads/feat/v2-compatible-problems.zip"
ARG EXPERIMENTS="https://github.com/Ensepro/ensepro-experiments-sl1m/archive/refs/heads/main.zip"
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

RUN apt-get clean \
 && apt-get update \
 && apt-get -y install sudo vim unzip software-properties-common git jq \
 && apt-get -y install openjdk-8* \
 && apt-get -y install maven maven* \
 && add-apt-repository -y ppa:deadsnakes/ppa \
 && apt-get update \
 && apt-get -y install python3.7 python3-pip

ADD $ENSEPRO_CORE /ensepro-core.zip
ADD $EXPERIMENTS /experiments.zip
ADD ag-setup.sh ag-setup.sh
ADD root/* /root/

RUN ./ag-setup.sh \
 && unzip ensepro-core.zip \
 && unzip experiments.zip \
 && mkdir ensepro-core \
 && mkdir experiments \
 && mkdir /root/resultados \
 && mv ensepro-core-feat-v2-compatible-problems/* /ensepro-core \
 && mv ensepro-experiments-sl1m-main/* /experiments \
 && rm -rf ensepro-core-feat-v2-compatible-problems \
 && rm -rf ensepro-experiments-sl1m-main \
 && rm ensepro-core.zip \
 && rm experiments.zip \
 && rm ag-setup.sh

RUN python3.7 -m pip install --upgrade pip \
 && python3.7 -m pip install Cython \
 && python3.7 -m pip install h5py \
 && python3.7 -m pip install -r /ensepro-core/requirements.txt \
 && echo "import nltk\nnltk.download('wordnet')\nnltk.download('omw')" | python3.7

WORKDIR /experiments/scripts