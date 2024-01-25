variable "number_of_az_linux_instances" {
  type = string
}

variable "az_linux_vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "az_linux_vm_admin_username" {
  type    = string
  default = "ubuntu"
}

variable "number_of_nic_instances" {
  type = string
}

variable "az_linux_vm_os_disk_storage_account_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "az_linux_vm_os_disk_caching" {
  type    = string
  default = "None"
}

variable "az_linux_vm_number_of_data_disks" {
  type = string
}

variable "az_linux_vm_data_disk_storage_account_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "az_linux_vm_data_disk_create_option" {
  type    = string
  default = "Empty"
}

variable "az_linux_vm_data_disk_size" {
  type    = string
  default = "300"
}

variable "runner_version" {
  type    = string
  default = "2.309.0"
}

variable "ARTIFACTORY_TOKEN" {
  sensitive = true
  type      = string
}

variable "RUNNER_TOKEN" {
  sensitive = true
  type      = string
}

variable "REPO_TOKEN" {
  sensitive = true
  type      = string
}

variable "RUNNER_GROUP" {
  type    = string
  default = "Azure"
}

variable "LABELS" {
  type    = string
  default = "sekhar"
}

variable "SUB1_SUB_ID" {
  type = string
}

variable "TENANT_ID" {
  type = string
}


variable "CLIENT_ID" {
  type = string
}


variable "CLIENT_SECRET" {
  sensitive = true
  type      = string
}

variable "SUB2_SUB_ID" {
  type = string
}

variable "az_linux_data_disk_lun" {
  type    = string
  default = "0"
}

variable "az_linux_data_disk_caching" {
  type    = string
  default = "None"
}

variable "os_type" {
  type = string
}

variable "rg_location" {
  type    = string
  default = "East US"
}

variable "ip_version" {
  type    = string
  default = "IPv4"
}

variable "SKU" {
  type    = string
  default = "Standard"
}

variable "prefix_length" {
  type = number
}

variable "number_of_prefixes" {
  type = number
}

variable "allocation_method" {
  type = string
}

variable "ssh_pub_key" {
  type = string
}

variable "enterprise" {
  type = string
}

variable "SUB2_rg_name" {
  type = string
}

variable "SUB2_sig_name" {
  type = string
}

variable "DOCKER_REGISTRY" {
  type = string
}

variable "DOCKER_USERNAME" {
  type = string
}