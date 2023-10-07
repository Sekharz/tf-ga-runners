resource "azurerm_ssh_public_key" "sekhar_ssh_pub_key" {
  provider            = azurerm.SUB1
  name                = "sekhar-ssh-pub-key"
  resource_group_name = var.rg_name
  location            = var.rg_location
  public_key          = var.ssh_pub_key
}
