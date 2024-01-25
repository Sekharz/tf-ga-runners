variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "sbn_bastion_id" {
  type = string
}

variable "bastion_pub_ip_id" {
  type = string
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