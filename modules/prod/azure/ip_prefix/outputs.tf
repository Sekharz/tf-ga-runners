output "ip_prefix" {
  value = azurerm_public_ip_prefix.az_vmss_pub_ip_prefix[*].ip_prefix
}

output "ip_id" {
  value = azurerm_public_ip_prefix.az_vmss_pub_ip_prefix[*].id
}