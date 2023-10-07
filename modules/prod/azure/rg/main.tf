resource "azurerm_resource_group" "sekhar_resource_group" {
  provider = azurerm.SUB1
  name     = "sekhar-resource-group"
  location = var.rg_location
}