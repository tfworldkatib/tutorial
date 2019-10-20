#!/bin/bash

kubectl apply -f helm-rbac.yaml
helm init --service-account tiller
sleep 60
helm repo update
helm install stable/nfs-server-provisioner --name kf --set=persistence.enabled=true,persistence.storageClass=-,persistence.size=200G --namespace=kube-system

