resource "azurerm_bastion_host" "sekhar_bastion_host" {
  provider            = azurerm.SUB1
  name                = "sekhar-bastion-host"
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku                 = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.sbn_bastion_id
    public_ip_address_id = var.bastion_pub_ip_id
  }
}