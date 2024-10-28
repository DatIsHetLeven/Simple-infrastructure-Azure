# modules/storage_account/main.tf

resource "random_string" "random" {
  length  = 5    
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "storageacct${random_string.random.id}"  # Verkort de naam
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.storage_account_type
}

