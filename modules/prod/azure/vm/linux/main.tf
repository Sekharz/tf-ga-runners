module "common_data" {
  source        = "../../common_data"
  SUB1_SUB_ID   = var.SUB1_SUB_ID
  SUB2_SUB_ID   = var.SUB2_SUB_ID
  CLIENT_ID     = var.CLIENT_ID
  CLIENT_SECRET = var.CLIENT_SECRET
  TENANT_ID     = var.TENANT_ID
  SUB2_rg_name  = var.SUB2_rg_name
  SUB2_sig_name = var.SUB2_sig_name
}

module "sekhar_rg" {
  source        = "../../rg"
  rg_location   = var.rg_location
  SUB1_SUB_ID   = var.SUB1_SUB_ID
  SUB2_SUB_ID   = var.SUB2_SUB_ID
  CLIENT_ID     = var.CLIENT_ID
  CLIENT_SECRET = var.CLIENT_SECRET
  TENANT_ID     = var.TENANT_ID
}

module "sekhar_vn" {
  source        = "../../vn"
  rg_location   = module.sekhar_rg.rg_location
  rg_name       = module.sekhar_rg.rg_name
  SUB1_SUB_ID   = var.SUB1_SUB_ID
  SUB2_SUB_ID   = var.SUB2_SUB_ID
  CLIENT_ID     = var.CLIENT_ID
  CLIENT_SECRET = var.CLIENT_SECRET
  TENANT_ID     = var.TENANT_ID
}

module "sekhar_sbn" {
  source        = "../../sbn"
  rg_name       = module.sekhar_rg.rg_name
  vn_name       = module.sekhar_vn.vn_name
  SUB1_SUB_ID   = var.SUB1_SUB_ID
  SUB2_SUB_ID   = var.SUB2_SUB_ID
  CLIENT_ID     = var.CLIENT_ID
  CLIENT_SECRET = var.CLIENT_SECRET
  TENANT_ID     = var.TENANT_ID
}

module "sekhar_pub_ip_prefixes" {
  source             = "../../ip_prefix"
  rg_location        = module.sekhar_rg.rg_location
  rg_name            = module.sekhar_rg.rg_name
  SKU                = var.SKU
  prefix_length      = var.prefix_length
  ip_version         = var.ip_version
  number_of_prefixes = var.number_of_prefixes
  SUB1_SUB_ID        = var.SUB1_SUB_ID
  CLIENT_ID          = var.CLIENT_ID
  CLIENT_SECRET      = var.CLIENT_SECRET
  TENANT_ID          = var.TENANT_ID
}

module "sekhar_bastion_pub_ip" {
  source              = "../../pub_ip"
  allocation_method   = var.allocation_method
  rg_location         = module.sekhar_rg.rg_location
  rg_name             = module.sekhar_rg.rg_name
  ip_version          = var.ip_version
  SKU                 = var.SKU
  public_ip_prefix_id = module.sekhar_pub_ip_prefixes[0].ip_id
  SUB1_SUB_ID         = var.SUB1_SUB_ID
  SUB2_SUB_ID         = var.SUB2_SUB_ID
  CLIENT_ID           = var.CLIENT_ID
  CLIENT_SECRET       = var.CLIENT_SECRET
  TENANT_ID           = var.TENANT_ID
}

module "sekhar_bastion_host" {
  source            = "../../bastion_host"
  rg_location       = module.sekhar_rg.rg_location
  rg_name           = module.sekhar_rg.rg_name
  sbn_bastion_id    = module.sekhar_sbn.sbn_bastion_id
  bastion_pub_ip_id = module.sekhar_bastion_pub_ip.pub_ip_id
  SUB1_SUB_ID       = var.SUB1_SUB_ID
  SUB2_SUB_ID       = var.SUB2_SUB_ID
  CLIENT_ID         = var.CLIENT_ID
  CLIENT_SECRET     = var.CLIENT_SECRET
  TENANT_ID         = var.TENANT_ID
}

module "sekhar_nats" {
  source        = "../../nat"
  rg_location   = module.sekhar_rg.rg_location
  rg_name       = module.sekhar_rg.rg_name
  SUB1_SUB_ID   = var.SUB1_SUB_ID
  SUB2_SUB_ID   = var.SUB2_SUB_ID
  CLIENT_ID     = var.CLIENT_ID
  CLIENT_SECRET = var.CLIENT_SECRET
  TENANT_ID     = var.TENANT_ID
}

module "nat_ip_sbn_assoc" {
  source                = "../../nat_sbn_ip_assoc"
  public_ip_prefix_id_1 = module.sekhar_pub_ip_prefixes[1].ip_id
  public_ip_prefix_id_2 = module.sekhar_pub_ip_prefixes[2].ip_id
  nat_id_1              = module.sekhar_nats.nat_id_1
  nat_id_2              = module.sekhar_nats.nat_id_2
  sbn_id_1              = module.sekhar_sbn.sbn_id_1
  sbn_id_2              = module.sekhar_sbn.sbn_id_2
  SUB1_SUB_ID           = var.SUB1_SUB_ID
  SUB2_SUB_ID           = var.SUB2_SUB_ID
  CLIENT_ID             = var.CLIENT_ID
  CLIENT_SECRET         = var.CLIENT_SECRET
  TENANT_ID             = var.TENANT_ID
}

module "sekhar_ssh_pub_key" {
  source        = "../../ssh"
  rg_location   = module.sekhar_rg.rg_location
  rg_name       = module.sekhar_rg.rg_name
  ssh_pub_key   = var.ssh_pub_key
  SUB1_SUB_ID   = var.SUB1_SUB_ID
  SUB2_SUB_ID   = var.SUB2_SUB_ID
  CLIENT_ID     = var.CLIENT_ID
  CLIENT_SECRET = var.CLIENT_SECRET
  TENANT_ID     = var.TENANT_ID
}

module "az_linux_vm_cloud_init" {
  source            = "../../cloud-init/linux"
  runner_version    = var.runner_version
  RUNNER_TOKEN      = var.RUNNER_TOKEN
  REPO_TOKEN        = var.REPO_TOKEN
  ARTIFACTORY_TOKEN = var.ARTIFACTORY_TOKEN
  RUNNER_GROUP      = var.RUNNER_GROUP
  LABELS            = var.LABELS
  enterprise        = var.enterprise
  DOCKER_REGISTRY = var.DOCKER_REGISTRY
  DOCKER_USERNAME = var.DOCKER_USERNAME
}

resource "azurerm_linux_virtual_machine_scale_set" "az_linux_vmss" {
  provider            = azurerm.SUB1
  name                = "sekhar-${var.os_type}-vmss"
  resource_group_name = module.sekhar_rg.rg_name
  location            = module.sekhar_rg.rg_location
  sku                 = var.az_linux_vm_size
  instances           = var.number_of_az_linux_instances
  admin_username      = var.az_linux_vm_admin_username

  # When Custom Data has been configured, it's not possible to remove it without tainting the Virtual Machine Scale Set, due to a limitation of the Azure API.
  custom_data = module.az_linux_vm_cloud_init.az_linux_vm_cloud_config_rendered

  network_interface {
    name    = "sekhar-${var.os_type}-vmss-ga-nic-1"
    primary = true

    ip_configuration {
      name      = "sekhar-vmss-pub-ip-1"
      primary   = true
      subnet_id = module.sekhar_sbn.sbn_id
      public_ip_address {
        name                = "sekhar-vmss-public-ip-1"
        domain_name_label   = "sekhar-vmss-dn-1"
        public_ip_prefix_id = module.sekhar_pub_ip_prefixes[1].ip_id # default ip SKU is Basic, so if you want to pair Standard SKU subnets with Basic IPs its not possible. We would need Standard SKU IPs too. Making a prefix of Standard SKU makes it easier to pair and also to whitelist as every machine is going to have one public IP.
      }
    }
  }

  network_interface {
    name    = "sekhar-${var.os_type}-vmss-ga-nic-2"
    primary = false

    ip_configuration {
      name      = "sekhar-vmss-public-ip-2"
      primary   = true
      subnet_id = module.sekhar_sbn.sbn_id
      public_ip_address {
        name                = "sekhar-vmss-public-ip-2"
        domain_name_label   = "sekhar-vmss-dn-2"
        public_ip_prefix_id = module.sekhar_pub_ip_prefixes[2].ip_id # default ip SKU is Basic, so if you want to pair Standard SKU subnets with Basic IPs its not possible. We would need Standard SKU IPs too. Making a prefix of Standard SKU makes it easier to pair and also to whitelist as every machine is going to have one public IP.
      }
    }
  }

  admin_ssh_key {
    username   = var.az_linux_vm_admin_username
    public_key = module.sekhar_ssh_pub_key.ssh_pub_key
  }

  os_disk {
    storage_account_type = var.az_linux_vm_os_disk_storage_account_type
    caching              = var.az_linux_vm_os_disk_caching
  }

  source_image_id = module.common_data.SUB2_ubuntu_image_id

  data_disk {
    caching              = var.az_linux_data_disk_caching
    create_option        = var.az_linux_vm_data_disk_create_option
    disk_size_gb         = var.az_linux_vm_data_disk_size
    lun                  = var.az_linux_data_disk_lun
    storage_account_type = var.az_linux_vm_data_disk_storage_account_type
  }
}