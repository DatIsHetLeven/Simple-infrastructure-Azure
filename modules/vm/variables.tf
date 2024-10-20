variable "vm_name" {
  description = "The name of the virtual machine."
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The location where the VM will be created."
}

variable "vm_size" {
  description = "The size of the VM."
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "The admin username for the VM."
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key."
  default     = "~/.ssh/id_rsa.pub"
}

variable "network_interface_ids" {
  description = "A list of network interface IDs to attach to the VM."
}
