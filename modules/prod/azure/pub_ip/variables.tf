variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "SUB1_SUB_ID" {
  type = string
}

variable "TENANT_ID" {
  type = string
}

#Stored in vault in path Azure
variable "CLIENT_ID" {
  type = string
}

#Stored in vault in path Azure
variable "CLIENT_SECRET" {
  sensitive = true
  type      = string
}

variable "SUB2_SUB_ID" {
  type = string
}

variable "allocation_method" {
  type = string
}

variable "ip_version" {
  type = string
}

variable "public_ip_prefix_id" {
  type = string
}

variable "SKU" {
  type = string
}