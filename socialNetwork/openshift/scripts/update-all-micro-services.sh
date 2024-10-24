#!/bin/bash

cd $(dirname $0)/..

NS='ai4cloudops-11855c'

for service in $( ls | grep yaml | grep service ); do
  ./scripts/update-micro-service.sh --micro-service=$service --namespace=${NS}
done

cd - >/dev/null
