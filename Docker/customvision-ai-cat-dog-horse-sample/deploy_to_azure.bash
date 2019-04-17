#!/bin/bash
# zmienne konfiguracyjne

RND=$RANDOM

ACR_LOCATION=northeurope
ACR_GROUP=rg-machinelearning
ACR_NAME=djkormoacrml$RND
ACI_NAME=djkormoaciml$RND

# domyslna nazwa grupy 
az configure --defaults group=$ACR_GROUP

# domyslna lokalizacja rejestru z obrazami 
az configure --defaults location=$ACR_LOCATION

# odswiezamy zawartosc repozytorium w ramach galęzi master 
git checkout master
# pobieramy zawartość repozytorium 
git pull
# weryfikujemy niespójności zawartości lokalnego i zdalnego repozytorium 
git status

# zawartosc pliku DockerFile
cat Dockerfile 


# nowa grupa zasobów
az group create --name $ACR_GROUP

# tworzymy rejestr dla kontenerów 
az acr create  --name $ACR_NAME --sku Basic

# włączenie konta administratorskiego
az acr update -n  $ACR_NAME --admin-enabled true

# pobranie wygenerowanego użytkownika i hasła
ACR_USERNAME=$ACR_NAME
ACR_PASSWORD=$(az acr credential show --name djkormoacrml --query "passwords[0].value")

echo "$ACR_USERNAME"
echo "$ACR_PASSWORD"


# budujemy obraz kontenerowy  na podstawie zawartości pliku Dockerfile

az acr build --registry $ACR_NAME --image ai-customvision:v1 .


# lista zbudowanych obrazów
az acr repository list --name $ACR_NAME --output table

# szczegoly 
az acr repository show -n $ACR_NAME -t ai-customvision:v1

# utworzenie instancji obrazu ->utworzenie aplikacji 

echo "$ACR_PASSWORD"

#start='date +%s'

az container create --resource-group $ACR_GROUP \
    --name $ACI_NAME \
    --image $ACR_NAME.azurecr.io/ai-customvision:v1 \
    --cpu 2 --memory 4 \
    --registry-login-server $ACR_NAME.azurecr.io \
    --dns-name-label ai-customvision \
    --ports 80 \
    --ip-address=Public \
    --registry-username $ACR_USERNAME #\
    #--registry-password $ACR_PASSWORD
    



# lista uruchomionych kontenerow

 az container show --resource-group  $ACR_GROUP \
 --name $ACI_NAME \
  --output table

# IP
 az container show --resource-group  $ACR_GROUP \
 --name $ACI_NAME \
 --query ipAddress.ip \
 --output table

ACI_IP=$(az container show --resource-group  $ACR_GROUP \
 --name $ACI_NAME \
 --query ipAddress.ip \
 --output table)

URL="http://$ACI_IP:80/image"
echo $ACI_IP
echo $URL
# aplikacja dostępna pod adresem 
# http://ai-customvision.northeurope.azurecontainer.io:80

# testowanie
clear
# koty
curl -X POST http://ai-customvision.northeurope.azurecontainer.io/image -F imageData=@images/cat1.jpg
curl -X POST http://ai-customvision.northeurope.azurecontainer.io/image -F imageData=@images/cat2.jpg

# psy
curl -X POST http://ai-customvision.northeurope.azurecontainer.io/image -F imageData=@images/dog1.jpg
curl -X POST http://ai-customvision.northeurope.azurecontainer.io/image -F imageData=@images/dog2.jpg

# konie
curl -X POST http://ai-customvision.northeurope.azurecontainer.io/image -F imageData=@images/horse1.jpg
curl -X POST http://ai-customvision.northeurope.azurecontainer.io/image -F imageData=@images/horse2.jpg



# curl http://ai-customvision.northeurope.azurecontainer.io/image POST -d 'imageData=@images/horse1.jpg'

# usuwamy zasoby w ramach calej grupy 
az group delete --name $ACR_GROUP --no-wait -y
