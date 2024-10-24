
cd $(dirname $0)/..

NS="ai4cloudops-11855c"

oc create namespace ${NS}

for service in *service*.yaml ; do
  oc apply -f $service -n ${NS}
done

cd - >/dev/null
