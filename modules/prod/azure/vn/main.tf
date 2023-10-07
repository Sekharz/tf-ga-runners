resource "azurerm_virtual_network" "sekhar_vn" {
  provider            = azurerm.SUB1
  name                = "sekhar-virtual-network"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/22"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}