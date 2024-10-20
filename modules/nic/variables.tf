variable "nic_name" {
  description = "The name of the network interface."
  type        = string
}

variable "location" {
  description = "The location where the NIC will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that contains the NIC."
  type        = string
}

variable "ip_config_name" {
  description = "The name of the IP configuration."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the NIC."
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The allocation method for the private IP address (Dynamic or Static)."
  type        = string
}
