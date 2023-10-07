resource "azurerm_subnet" "sekhar_subnet_1" {
  provider             = azurerm.SUB1
  name                 = "sekhar-subnet-1"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vn_name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "sekhar_subnet_2" {
  provider             = azurerm.SUB1
  name                 = "sekhar-subnet-1"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vn_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "sekhar_bastion_subnet" {
  provider             = azurerm.SUB1
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vn_name
  address_prefixes     = ["10.0.3.0/26"]
}