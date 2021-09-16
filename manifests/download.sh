#!/bin/bash

RELEASE=v0.45.0

curl -L -s "https://github.com/kubevirt/kubevirt/releases/download/${RELEASE}/kubevirt-operator.yaml" > operator/kubevirt-operator.yaml
curl -L -s "https://github.com/kubevirt/kubevirt/releases/download/${RELEASE}/kubevirt-cr.yaml" > cr/kubevirt-cr.yaml 


kubectl apply -f operator/

kubectl label ns kubevirt istio-injection=enabled

kubectl -n kubevirt wait kv kubevirt --for condition=Available

kubectl create configmap kubevirt-config -n kubevirt --from-literal debug.useEmulation=true
kubectl label node k3d-ci-server-0 kubevirt.io/schedulable=true
kubectl apply -f cr/

