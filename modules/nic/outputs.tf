output "nic_id" {
  description = "The ID of the network interface."
  value       = azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  description = "The private IP address of the network interface."
  value       = azurerm_network_interface.nic.private_ip_address
}
