#! /bin/bash
jq '.cbc.path_answer_generator = $jar' --arg jar $1 /ensepro-core/ensepro/configuracoes/configs.json > tmp.$$.json \
  && mv tmp.$$.json /ensepro-core/ensepro/configuracoes/configs.json

jq '.cbc.slm1_factor = $slm1_factor' --arg slm1_factor $2 /ensepro-core/ensepro/configuracoes/configs.json > tmp.$$.json \
  && mv tmp.$$.json /ensepro-core/ensepro/configuracoes/configs.json

jq '.cbc.slm1_factor_only_l1 = $slm1_factor_only_l1' --arg slm1_factor_only_l1 $3 /ensepro-core/ensepro/configuracoes/configs.json > tmp.$$.json \
  && mv tmp.$$.json /ensepro-core/ensepro/configuracoes/configs.json


#usage:
#    /root/set-ag.sh "/jars/ensepro-answer-generator-size-base.jar" -1 false
#    /root/set-ag.sh "/jars/ensepro-answer-generator-size-slm1.jar" 100 true