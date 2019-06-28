#!/bin/bash
# based on https://github.com/Azure/AzureStack-QuickStart-Templates/tree/master/101-vm-linux-minikube

# install Virtualbox
echo "Install Virtualbox"
bash -c 'echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" >> /etc/apt/sources.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
apt-get update 
apt-get install -y virtualbox-6.0

# install kubectl 
echo "Install kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# install  minikube 
echo "Install minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.0.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

# run minukube

minikube start 

# run first app
echo "Run first apps"
kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080

kubectl expose deployment hello-minikube --type=NodePort

curl $(minikube service hello-minikube --url)


kubectl run chess-ai-blue --image=djkormo/chess-ai:blue --port=80

kubectl expose deployment chess-ai-blue --type=LoadBalancer --name=chess-ai-blue


lscpu | grep -i virtual

#Virtualization:      VT-x
#Virtualization type: full


# install rdp 

echo "Install xfce4"
apt-get -y install xfce4

echo "Install xrdp"
apt-get -y install xrdp

echo "Configure xsession"
echo xfce4-session >~/.xsession

echo "Restart xrdp"
service xrdp restart

echo "Install Firefox"
apt-get -y install firefox

