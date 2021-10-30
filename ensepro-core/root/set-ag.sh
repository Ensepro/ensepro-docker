#! /bin/bash
jq '.cbc.path_answer_generator = $jar' --arg jar $1 /ensepro-core/ensepro/configuracoes/configs.json > tmp.$$.json \
  && mv tmp.$$.json /ensepro-core/ensepro/configuracoes/configs.json

#usage:
#    /root/set-ag.sh "/jars/ensepro-answer-generator-size-base.jar"
#    /root/set-ag.sh "/jars/ensepro-answer-generator-size-slm1.jar"