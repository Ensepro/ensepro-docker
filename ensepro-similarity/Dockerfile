FROM python:3.7.9-slim

# variables
ARG BASE_URL="http://143.107.183.175:22980/download.php?file=embeddings/"
ARG TYPE="fasttext"
ARG FILE="cbow_s50"
ARG EMBEDDING=$BASE_URL"/"$TYPE"/"$FILE
ARG EMBEDDING_SERVICE="https://github.com/Ensepro/ensepro-similarity-service/archive/refs/heads/master.zip"

# base settings for system
RUN apt-get update \
 && apt-get -y install unzip


# EXPOSE 8098

# ENTRYPOINT ["python", "/embedding/main/main.py"]

