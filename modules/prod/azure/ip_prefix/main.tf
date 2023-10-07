resource "azurerm_public_ip_prefix" "az_vmss_pub_ip_prefix" {
  provider            = azurerm.SUB1
  count               = var.number_of_prefixes
  name                = "sekhar-pub-ip-prefix-${count.index}"
  location            = var.rg_location
  resource_group_name = var.rg_name

  sku           = var.SKU
  ip_version    = var.ip_version
  prefix_length = var.prefix_length //current is 28. So 16 address are enough for 10 machines under the vmss
}