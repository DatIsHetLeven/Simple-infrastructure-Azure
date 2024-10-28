#!/bin/bash

# Check if the module directory is provided
MODULE_DIR=$1

if [ -z "$MODULE_DIR" ]; then
  echo "Please specify the module directory (e.g., modules/resource_group)"
  exit 1
fi

# Set Azure subscription ID
export ARM_SUBSCRIPTION_ID="c61237f5-f257-431f-ac44-04f8dac8b0fd"

# Create a temporary providers.tf file with the provider configuration
TEMP_PROVIDER_FILE="$MODULE_DIR/temp_providers.tf"

cat <<EOF > "$TEMP_PROVIDER_FILE"
provider "azurerm" {
  features {}
  subscription_id = "$ARM_SUBSCRIPTION_ID"
}
EOF

# Create a temporary backend.tf file with the remote backend configuration
TEMP_BACKEND_FILE="$MODULE_DIR/temp_backend.tf"

cat <<EOF > "$TEMP_BACKEND_FILE"
terraform {
  backend "azurerm" {
    resource_group_name   = "rg-storage"
    storage_account_name  = "tfstoragemurat123"
    container_name        = "tfstate"
    key                   = "terraform_${MODULE_DIR##*/}.tfstate"  # Unieke key per module
  }
}
EOF

# Debugging: check if the temp files are created
echo "Temporary provider file created at: $TEMP_PROVIDER_FILE"
echo "Temporary backend file created at: $TEMP_BACKEND_FILE"

# Navigate to the module directory
cd "$MODULE_DIR" || exit

# Run Terraform init and apply
terraform init
terraform apply -auto-approve

# Clean up the temporary provider and backend files after apply
if [ -f "$TEMP_PROVIDER_FILE" ]; then
  echo "Removing temporary provider file..."
  rm -f "$TEMP_PROVIDER_FILE"
  if [ $? -eq 0 ]; then
    echo "Temporary provider file removed successfully."
  else
    echo "Failed to remove temporary provider file."
  fi
fi

if [ -f "$TEMP_BACKEND_FILE" ]; then
  echo "Removing temporary backend file..."
  rm -f "$TEMP_BACKEND_FILE"
  if [ $? -eq 0 ]; then
    echo "Temporary backend file removed successfully."
  else
    echo "Failed to remove temporary backend file."
  fi
fi

# Return to the root directory
cd -
