#!/bin/bash

# Requires the file demo-magic.sh, available at
# # https://github.com/paxtonhare/demo-magic
. ~/demo-magic.sh

# Variables
DEMO_PROMPT="${GREEN}➜  ${CYAN}03_05 ${COLOR_RESET}"

eval $(crc oc-env)

clear
pe "oc whoami"
pe "oc project"
pe "oc apply -f 01-service-mesh.yaml"
pe "bat 02-app.yaml"
pe "oc apply -f 02-app.yaml"
pe "watch oc get pods -n service-mesh-test"
wait

clear
pe "curl http://apitest.apps-crc.testing/fortune --silent | jq"
pe "crc console --credentials"
wait

