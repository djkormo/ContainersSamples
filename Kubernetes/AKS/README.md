

# create resource group 
az group create --name myAKSCluster --location northeurope

# create first k8s cluster  with one node
az aks create --resource-group myAKSCluster --name myAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys

# installing kubectl 
az aks install-cli

# getting credentials from k8s server
az aks get-credentials --resource-group myAKSCluster --name myAKSCluster

# see all nodes  
kubectl get nodes

# running  first sample app
kubectl apply -f https://github.com/Azure-Samples/azure-voting-app-redis/blob/master/azure-vote-all-in-one-redis.yaml

