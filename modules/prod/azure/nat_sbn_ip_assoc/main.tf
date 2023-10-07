resource "azurerm_subnet_nat_gateway_association" "sbn_nat_association_1" {
  provider       = azurerm.SUB1
  subnet_id      = var.sbn_id_1
  nat_gateway_id = var.nat_id_1
}

resource "azurerm_subnet_nat_gateway_association" "sbn_nat_association_2" {
  provider       = azurerm.SUB1
  subnet_id      = var.sbn_id_2
  nat_gateway_id = var.nat_id_2
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "nat_ip_prefix_association_1" {
  provider            = azurerm.SUB1
  nat_gateway_id      = var.nat_id_1
  public_ip_prefix_id = var.public_ip_prefix_id_1
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "nat_ip_prefix_association_2" {
  provider            = azurerm.SUB1
  nat_gateway_id      = var.nat_id_2
  public_ip_prefix_id = var.public_ip_prefix_id_2
}