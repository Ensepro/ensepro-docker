FROM ubuntu:16.04

# variables
ARG PALAVRAS_REVISION="11952"

# base settings for system
RUN apt-get update \
 && apt-get -y install sudo vim unzip bzip2 locales wget icu-devtools \
 && apt-get -y install perl perl-modules build-essential gcc g++ autoconf automake libdb-dev cg3 \
 && apt-get -y install libc6-dev-i386 \
 && locale-gen pt_BR.UTF-8

ENV LANG=pt_BR.UTF-8
ENV PERL_UNICODE=SDA

# copy necessary files
COPY palavras-r$PALAVRAS_REVISION.tar.bz2 palavras-r$PALAVRAS_REVISION.tar.bz2
COPY palavras.sh /root/palavras.sh

# setup and Palavras installation
RUN tar -xjf palavras-r$PALAVRAS_REVISION.tar.bz2 && rm palavras-r$PALAVRAS_REVISION.tar.bz2
RUN palavras-r$PALAVRAS_REVISION/install-ubuntu.sh
RUN rm -rf palavras-r$PALAVRAS_REVISION

ENTRYPOINT ["bash"]