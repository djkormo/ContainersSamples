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



helm search grafana

helm inspect stable/grafana

helm install stable/grafana --name mygrafana --set service.type=NodePort

helm status mygrafana

kubectl get pods

kubectl get secret --namespace default mygrafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


export NODE_PORT=$(sudo kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services mygrafana)

export NODE_IP=$(sudo kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")

echo http://$NODE_IP:$NODE_PORT



sudo helm list


