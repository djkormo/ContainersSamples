#!/bin/bash

# based on https://docs.microsoft.com/en-us/azure/container-instances/container-instances-using-azure-container-registry

# zmienne konfiguracyjne

RND=$RANDOM

ACR_LOCATION=northeurope
ACR_GROUP=rg-aks-simple
ACR_NAME=acrml$RND
ACI_NAME=aciml$RND
AKV_NAME=keyvault$RND

# domyslna nazwa grupy 
az configure --defaults group=$ACR_GROUP

# domyslna lokalizacja rejestru z obrazami 
az configure --defaults location=$ACR_LOCATION



INIT_DIR=.

cd $INIT_DIR

#!/bin/bash
if [ ! -d $INIT_DIR/ssh ]; then
  
  mkdir ssh
  echo "Nie masz katalogu ssh"  
fi
cd ssh


# creating ssh keys
ssh-keygen -t rsa -b 2048 -f id_rsa_k8s-develop 

# creating certificates

cd $INIT_DIR

if [ ! -d $INIT_DIR/keys ]; then
  
  mkdir keys
  echo "Nie masz katalogu keys"  
fi
cd keys

# generating keys  for tls 
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out aks-ingress-tls.crt \
    -keyout aks-ingress-tls.key \
    -subj "//CN=kormogos.onmicrosoft.com/O=aks-ingress-tls"

cd   $INIT_DIR


# odswiezamy zawartosc repozytorium w ramach galêzi master 
git checkout master

# pobieramy zawartoœæ repozytorium 
git pull

# weryfikujemy niespójnoœci zawartoœci lokalnego i zdalnego repozytorium 
git status

az group create --name $ACR_GROUP

# tworzymy rejestr dla kontenerów 
az acr create  --name $ACR_NAME --sku Basic

# w³¹czenie konta administratorskiego
az acr update -n  $ACR_NAME --admin-enabled true


# key vault 
az keyvault create -g $ACR_GROUP -n $AKV_NAME

# service principal 
az keyvault secret set \
  --vault-name $AKV_NAME \
  --name $ACR_NAME-pull-pwd \
  --value $(az ad sp create-for-rbac \
                --name http://$ACR_NAME-pull \
                --scopes $(az acr show --name $ACR_NAME --query id --output tsv) \
                --role acrpull \
                --query password \
                --output tsv)

				
az keyvault secret set \
    --vault-name $AKV_NAME \
    --name $ACR_NAME-pull-usr \
    --value $(az ad sp show --id http://$ACR_NAME-pull --query appId --output tsv)				



ACR_LOGIN_SERVER=$(az acr show --name $ACR_NAME --resource-group $ACR_GROUP --query "loginServer" --output tsv)


# pobranie najnowszej wersji AKS w danym regionie

AKS_VERSION=$(az aks get-versions -l $ACR_LOCATION --query 'orchestrators[-1].orchestratorVersion' -o tsv)


AKS_RG=$ACR_GROUP
AKS_NAME=aks-simple$RND
AKS_NODES=2
AKS_VM_SIZE=Standard_B2s


echo "$AKS_RG"
echo "$AKS_NAME"
echo "$AKS_NODES"
echo "$INIT_DIR"
echo "$SP_PASSWORD"
echo "$AKS_VERSION"
echo "$APP_ID"
echo "$AKS_VM_SIZE"

#az aks create --resource-group $AKS_RG \
#--name $AKS_NAME --node-count $AKS_NODES \
#--ssh-key-value $INIT_DIR/ssh/id_rsa_k8s-develop.pub \
#--client-secret=$SP_PASSWORD \
#--service-principal=$APP_ID \
#--enable-addons monitoring \
#--kubernetes-version $AKS_VERSION \
#--node-vm-size $AKS_VM_SIZE --tags 'environment=develop'  \
#--disable-rbac


# do obs³ugi autoskalowania

az extension add --name aks-preview

az feature register --name VMSSPreview --namespace Microsoft.ContainerService

az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/VMSSPreview')].{Name:name,State:properties.state}"

az provider register --namespace Microsoft.ContainerService

  

az aks create --resource-group $AKS_RG \
    --name  $AKS_NAME \
    --enable-addons monitoring \
    --kubernetes-version $AKS_VERSION \
    --generate-ssh-keys \
	--node-count $AKS_NODES \
	--node-vm-size $AKS_VM_SIZE \
	--tags 'environment=develop' \ 
	--disable-rbac
	--enable-vmss \
    --enable-cluster-autoscaler \
    --min-count 1 \
    --max-count 3
