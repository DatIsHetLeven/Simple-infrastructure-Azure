variable "resource_group_name" {
  description = "The name of the resource group to deploy to."
  type        = string
}

variable "location" {
  description = "The location to deploy the storage account."
  type        = string
  default     = "westeurope"
}

variable "storage_account_type" {
  description = "The replication type for the storage account."
  type        = string
  default     = "LRS"  
}

