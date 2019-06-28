# based on https://github.com/Azure/AzureStack-QuickStart-Templates/tree/master/101-vm-linux-minikube



# install Virtualbox
sudo bash -c 'echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" >> /etc/apt/sources.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update 
sudo apt-get install -y virtualbox-6.0

# install kubectl 

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# install  minikube 
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v1.0.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

# run minukube

minikube start 

# run first app

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
sudo apt-get -y install xfce4

echo "Install xrdp"
sudo apt-get -y install xrdp

echo "Configure xsession"
sudo echo xfce4-session >~/.xsession

echo "Restart xrdp"
sudo service xrdp restart

echo "Install Firefox"
sudo apt-get -y install firefox

