data "azurerm_shared_image_gallery" "SUB2_ubuntu_gold_image_gallery" {
  provider            = azurerm.SUB2_gold_images
  name                = var.SUB2_rg_name
  resource_group_name = var.SUB2_sig_name
}

data "azurerm_shared_image" "SUB2_ubuntu_gold_image" {
  provider            = azurerm.SUB2_gold_images
  name                = "Ubuntu-22.04_base"
  gallery_name        = data.azurerm_shared_image_gallery.SUB2_ubuntu_gold_image_gallery.name
  resource_group_name = var.SUB2_sig_name
}

data "azurerm_shared_image_version" "SUB2_ubuntu_gold_image_version" {
  provider            = azurerm.SUB2_gold_images
  name                = "recent" # "recent" is a tag to use the most recent image version
  image_name          = data.azurerm_shared_image.SUB2_ubuntu_gold_image.name
  gallery_name        = data.azurerm_shared_image.SUB2_ubuntu_gold_image.gallery_name
  resource_group_name = var.SUB2_sig_name
}

data "azurerm_shared_image_gallery" "SUB2_win_gold_image_gallery" {
  provider            = azurerm.SUB2_gold_images
  name                = var.SUB2_rg_name
  resource_group_name = var.SUB2_sig_name
}

data "azurerm_shared_image" "SUB2_win19_gold_image" {
  provider            = azurerm.SUB2_gold_images
  name                = "Windows-2019_base"
  gallery_name        = data.azurerm_shared_image_gallery.SUB2_win_gold_image_gallery.name
  resource_group_name = data.azurerm_shared_image_gallery.SUB2_win_gold_image_gallery.resource_group_name
}

data "azurerm_shared_image_version" "SUB2_win19_gold_image_version" {
  provider            = azurerm.SUB2_gold_images
  name                = "recent" # "recent" is a tag to use the most recent image version
  image_name          = data.azurerm_shared_image.SUB2_win19_gold_image.name
  gallery_name        = data.azurerm_shared_image.SUB2_win19_gold_image.gallery_name
  resource_group_name = data.azurerm_shared_image.SUB2_win19_gold_image.resource_group_name
}

data "azurerm_shared_image" "SUB2_win22_gold_image" {
  provider            = azurerm.SUB2_gold_images
  name                = "Windows-2022_base"
  gallery_name        = data.azurerm_shared_image_gallery.SUB2_win_gold_image_gallery.name
  resource_group_name = data.azurerm_shared_image_gallery.SUB2_win_gold_image_gallery.resource_group_name
}

data "azurerm_shared_image_version" "SUB2_win22_gold_image_version" {
  provider            = azurerm.SUB2_gold_images
  name                = "recent" # "recent" is a tag to use the most recent image version
  image_name          = data.azurerm_shared_image.SUB2_win22_gold_image.name
  gallery_name        = data.azurerm_shared_image.SUB2_win22_gold_image.gallery_name
  resource_group_name = data.azurerm_shared_image.SUB2_win22_gold_image.resource_group_name
}