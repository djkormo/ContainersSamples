# based on https://github.com/AzureRED/MiniKube-on-Azure-VM



ACR_LOCATION=northeurope
ACR_GROUP=rg-aks-simple
ACR_NAME=acr$RND
ACI_NAME=aci$RND
AKV_NAME=keyvault$RND
VM_NAME=myUbuntuMinikube
# domyslna nazwa grupy 
az configure --defaults group=$ACR_GROUP

# domyslna lokalizacja rejestru z obrazami 
az configure --defaults location=$ACR_LOCATION


az vm create \
  --resource-group $ACR_GROUP \
  --name $VM_NAME \
  --image UbuntuLTS \
  --size Standard_D2_v3  \
  --admin-username azureuser \
  --admin-password Pa55word2019..
  #--generate-ssh-keys
  
  
az vm open-port --port 22 --resource-group $ACR_GROUP --name $VM_NAME  


#az vm extension set -g $ACR_GROUP --vm-name $VM_NAME \
#    --name customScript \
#    --publisher Microsoft.Azure.Extensions \
#    --settings @C:/developing/Azure/535/AzureAchitectSamples/t9Network/wp-config.json --verbose
	
	
	
	
	
#az vm list-sizes \
#--location eastus \
#--query '[].{Name:name,CPU:numberOfCores,Memory:memoryInMb}' \
#--output table | grep _v3