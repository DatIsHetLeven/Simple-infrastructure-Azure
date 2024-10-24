terraform {
  backend "azurerm" {
    resource_group_name   = "rg-storage"
    storage_account_name  = "tfstoragemurat123"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
