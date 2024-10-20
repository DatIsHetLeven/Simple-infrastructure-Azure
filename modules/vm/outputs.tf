output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_public_ip" {
  description = "The public IP address of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}
