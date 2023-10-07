output "az_vmss_id" {
  value = azurerm_linux_virtual_machine_scale_set.az_linux_vmss.id
}

output "az_vmss_instances" {
  value = azurerm_linux_virtual_machine_scale_set.az_linux_vmss.instances
}

output "prefix_ip_cidr" {
  value = module.ip_prefix.ip_prefix
}