resource "azurerm_nat_gateway" "sekhar_nat_gateway_1" {
  provider                = azurerm.SUB1
  name                    = "sekhar-nat-Gateway-1"
  location                = var.rg_location
  resource_group_name     = var.rg_name
  idle_timeout_in_minutes = 10
}

resource "azurerm_nat_gateway" "sekhar_nat_gateway_2" {
  provider                = azurerm.SUB1
  name                    = "sekhar-nat-Gateway-2"
  location                = var.rg_location
  resource_group_name     = var.rg_name
  idle_timeout_in_minutes = 10
}