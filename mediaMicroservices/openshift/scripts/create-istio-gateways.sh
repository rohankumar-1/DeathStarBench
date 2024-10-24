#!/bin/bash

NS="ai4cloudops-11855c"

cd $(dirname $0)/..

oc apply -f networking/istio-gateway/mediamicrosvc-gateway.yaml -n ${NS}

cd -
