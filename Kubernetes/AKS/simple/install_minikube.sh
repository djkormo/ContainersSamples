#!/bin/sh

# based on https://github.com/Azure/AzureStack-QuickStart-Templates/tree/master/101-vm-linux-minikube

echo "Setting Frontend as Non-Interactive"
export DEBIAN_FRONTEND=noninteractive

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
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
echo "Start minikube"
#minikube start 


# install  Docker-ce 
echo "Install Docker-ce"

#add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#apt-get install docker-ce
#apt-cache policy docker-ce

apt-get remove docker docker-engine docker.io
apt-get install docker.io -y
systemctl start docker
systemctl enable docker

