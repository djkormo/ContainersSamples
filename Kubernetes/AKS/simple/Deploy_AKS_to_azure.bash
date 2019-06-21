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

# odswiezamy zawartosc repozytorium w ramach gal�zi master 
git checkout master

# pobieramy zawarto�� repozytorium 
git pull

# weryfikujemy niesp�jno�ci zawarto�ci lokalnego i zdalnego repozytorium 
git status

az group create --name $ACR_GROUP

# tworzymy rejestr dla kontener�w 
az acr create  --name $ACR_NAME --sku Basic

# w��czenie konta administratorskiego
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


az aks create --resource-group $AKS_RG \
--name $AKS_NAME --node-count $AKS_NODES \
--ssh-key-value $INIT_DIR/ssh/id_rsa_k8s-uat.pub \
--client-secret=$SP_PASSWORD \
--service-principal=$APP_ID \
--enable-addons monitoring \
--kubernetes-version $AKS_VERSION \
--node-vm-size $AKS_VM_SIZE --tags 'environment=develop'  \
--disable-rbac

