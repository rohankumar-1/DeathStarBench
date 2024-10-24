#!/bin/bash

cd $(dirname $0)/..

NS="ai4cloudops-11855c"

for service in *service.yaml
do
  ./scripts/update-micro-service.sh --micro-service=$service --namespace=${NS}
done

cd -
