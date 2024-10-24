#!/bin/bash

cd $(dirname $0)/..

NS="ai4cloudops-11855c"

oc create namespace ${NS}

for service in *service.yaml
do
  oc apply -f $service --namespace ${NS}
done

cd -
