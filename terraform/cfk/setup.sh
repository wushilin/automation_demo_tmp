#!/bin/sh
#
#
kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl patch storageclass gp2 -p '{"allowVolumeExpansion":true}'
kubectl create ns confluent
helm upgrade --install operator confluentinc/confluent-for-kubernetes -n confluent --set namespaced=false
kubectl create secret generic basicsecret \
  --from-file=basic.txt=basic.txt --namespace confluent
kubectl create secret generic tls-confluent \
  --from-file=fullchain.pem=certs/server.pem \
  --from-file=cacerts.pem=certs/CA.pem \
  --from-file=privkey.pem=certs/server.key \
  --namespace confluent
kubectl apply -f confluent-platform.yaml

