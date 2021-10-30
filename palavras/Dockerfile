FROM ubuntu:16.04

# variables
ARG PALAVRAS_REVISION="11952"
ARG PALAVRAS_SERVICE="https://github.com/Ensepro/ensepro-palavras-service/archive/refs/heads/master.zip"

RUN apt-get update \
 && apt-get -y install sudo vim unzip bzip2 locales wget icu-devtools software-properties-common \
 && add-apt-repository -y ppa:deadsnakes/ppa \
 && apt-get update \
 && apt-get -y install python3.7 python3-pip \
 && apt-get -y install perl perl-modules build-essential gcc g++ autoconf automake libdb-dev cg3 \
 && apt-get -y install libc6-dev-i386 \
 && locale-gen pt_BR.UTF-8

ENV LANG=pt_BR.UTF-8
ENV PERL_UNICODE=SDA

# copy/download necessary files
COPY palavras-r$PALAVRAS_REVISION.tar.bz2 palavras-r$PALAVRAS_REVISION.tar.bz2
COPY root/palavras.sh /root/palavras.sh
ADD $PALAVRAS_SERVICE /service.zip

# setup Palavras
RUN tar -xjf palavras-r$PALAVRAS_REVISION.tar.bz2 \
 && rm palavras-r$PALAVRAS_REVISION.tar.bz2 \
 && palavras-r$PALAVRAS_REVISION/install-ubuntu.sh \
 && rm -rf palavras-r$PALAVRAS_REVISION

# setup palavras-service
RUN unzip service.zip \
 && rm service.zip \
 && python3.7 -m pip install -r /ensepro-palavras-service-master/requirements.txt \
 && mkdir palavras \
 && mv /ensepro-palavras-service-master/* palavras/

WORKDIR /palavras/main

EXPOSE 8099

ENTRYPOINT ["python3.7", "Main.py"]