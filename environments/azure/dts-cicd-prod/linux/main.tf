locals {
  count = var.number_of_az_linux_instances
}

module "az_linux_vms" {
  source                                     = "../../../../modules/prod/azure/vm/linux"
  number_of_nic_instances                    = local.count
  number_of_az_linux_instances               = local.count
  az_linux_vm_size                           = var.az_linux_vm_size
  az_linux_vm_admin_username                 = var.az_linux_vm_admin_username
  az_linux_vm_os_disk_caching                = var.az_linux_vm_os_disk_caching
  az_linux_vm_os_disk_storage_account_type   = var.az_linux_vm_os_disk_storage_account_type
  az_linux_vm_number_of_data_disks           = local.count
  az_linux_vm_data_disk_storage_account_type = var.az_linux_vm_data_disk_storage_account_type
  az_linux_vm_data_disk_create_option        = var.az_linux_vm_data_disk_create_option
  az_linux_vm_data_disk_size                 = var.az_linux_vm_data_disk_size
  az_linux_data_disk_caching                 = var.az_linux_data_disk_caching
  az_linux_data_disk_lun                     = var.az_linux_data_disk_lun
  RUNNER_TOKEN                               = var.RUNNER_TOKEN
  REPO_TOKEN                                 = var.REPO_TOKEN
  ARTIFACTORY_TOKEN                          = var.ARTIFACTORY_TOKEN
  RUNNER_GROUP                               = var.RUNNER_GROUP
  LABELS                                     = var.LABELS
  SUB1_SUB_ID                                = var.SUB1_SUB_ID
  SUB2_SUB_ID                                = var.SUB2_SUB_ID
  CLIENT_ID                                  = var.CLIENT_ID
  CLIENT_SECRET                              = var.CLIENT_SECRET
  TENANT_ID                                  = var.TENANT_ID
  os_type                                    = var.os_type
  rg_location                                = var.rg_location
  number_of_prefixes                         = var.number_of_prefixes
  ip_version                                 = var.ip_version
  SKU                                        = var.SKU
  prefix_length                              = var.prefix_length
  allocation_method                          = var.allocation_method
  ssh_pub_key                                = var.ssh_pub_key
  enterprise                                 = var.enterprise
  SUB2_rg_name                               = var.SUB2_rg_name
  SUB2_sig_name                              = var.SUB2_sig_name
  DOCKER_REGISTRY = var.DOCKER_REGISTRY
  DOCKER_USERNAME = var.DOCKER_USERNAME
}