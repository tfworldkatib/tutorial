#!/bin/bash


sudo kubeadm init --kubernetes-version=v1.14.8 --pod-network-cidr=192.168.0.0/16

rm -rf $HOME/.kube
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f kubeadm-kuberouter.yaml
kubectl apply -f nfs-pvc.yaml

