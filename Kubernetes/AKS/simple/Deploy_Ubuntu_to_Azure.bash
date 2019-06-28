# based on https://github.com/AzureRED/MiniKube-on-Azure-VM

# based on https://www.brianlinkletter.com/create-a-nested-virtual-machine-in-a-microsoft-azure-linux-vm/


# based on https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-linux

RND=$RANDOM

RG_LOCATION=northeurope
RG_GROUP=rg-aks-simple

VM_NAME=myUbuntuMinikube$RND
# domyslna nazwa grupy 
az configure --defaults group=$RG_GROUP

# domyslna lokalizacja rejestru z obrazami 
az configure --defaults location=$RG_LOCATION


az vm create \
  --resource-group $RG_GROUP \
  --name $VM_NAME \
  --image UbuntuLTS \
  --size Standard_D2_v3  \
  --admin-username azureuser \
  --admin-password Pa55word2019..
  #--generate-ssh-keys
  
  
az vm open-port --port 3389 --resource-group $RG_GROUP --name $VM_NAME  


#az vm extension set -g $RG_GROUP --vm-name $VM_NAME \
#    --name customScript \
#    --publisher Microsoft.Azure.Extensions \
#    --settings @C:/developing/Azure/535/AzureAchitectSamples/t9Network/wp-config.json --verbose
	
	
	
	
	
#az vm list-sizes \
#--location northeurope \
#--query '[].{Name:name,CPU:numberOfCores,Memory:memoryInMb}' \
#--output table | grep _v3