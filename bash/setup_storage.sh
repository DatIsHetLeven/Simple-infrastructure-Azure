#!/bin/bash

# Parameters
RESOURCE_GROUP_NAME="rg-storage"
STORAGE_ACCOUNT_NAME="tfstoragemurat123"  # Geldige naam: alleen kleine letters en cijfers
CONTAINER_NAME="tfstate"
LOCATION="westeurope"



# Controleer of de resource group bestaat
echo "Check if resource group exists..."
az group show --name $RESOURCE_GROUP_NAME &> /dev/null
if [ $? -ne 0 ]; then
  echo "Resource group does not exist. Creating..."
  az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
else
  echo "Resource group already exists."
fi

# Controleer of het storage account bestaat
echo "Check if storage account exists..."
az storage account show --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME &> /dev/null
if [ $? -ne 0 ]; then
  echo "Storage account does not exist. Creating..."
  az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS
else
  echo "Storage account already exists."
fi

# Controleer of de container bestaat
echo "Check if storage container exists..."
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' --output tsv)
az storage container show --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY &> /dev/null
if [ $? -ne 0 ]; then
  echo "Container does not exist. Creating..."
  az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
else
  echo "Container already exists."
fi

echo "Setup complete!"



#Uitvoeren script: ./setup_storage.sh
