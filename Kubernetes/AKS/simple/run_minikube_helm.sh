#!/bin/sh

echo "Setting Frontend as Non-Interactive"
export DEBIAN_FRONTEND=noninteractive


echo "run Minikube"
minikube start

echo "Install and run Helm"

helm init 

helm version


# list all pods in kube-system namespace 
kubectl get pods --namespace kube-system
