output "nat_sbn_assoc_1" {
  value = azurerm_subnet_nat_gateway_association.sbn_nat_association_1.id
}

output "nat_sbn_assoc_2" {
  value = azurerm_subnet_nat_gateway_association.sbn_nat_association_2.id
}

output "nat_prefix_assoc_1" {
  value = azurerm_nat_gateway_public_ip_prefix_association.nat_ip_prefix_association_1.id
}

output "nat_prefix_assoc_2" {
  value = azurerm_nat_gateway_public_ip_prefix_association.nat_ip_prefix_association_2.id
}