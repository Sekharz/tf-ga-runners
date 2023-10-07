output "SUB2_ubuntu_image_id" {
  value = data.azurerm_shared_image_version.SUB2_ubuntu_gold_image_version.id
}

output "SUB2_win19_image_id" {
  value = data.azurerm_shared_image_version.SUB2_win19_gold_image_version.id
}

output "SUB2_win22_image_id" {
  value = data.azurerm_shared_image_version.SUB2_win22_gold_image_version.id
}