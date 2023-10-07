resource "azurerm_public_ip" "sekhar_bastion_pub_ip" {
  provider            = azurerm.SUB1
  name                = "sekhar-bastion-pub-ip"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = var.allocation_method
  ip_version          = var.ip_version
  public_ip_prefix_id = var.public_ip_prefix_id
  sku                 = var.SKU
}