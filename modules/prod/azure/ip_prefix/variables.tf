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

variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}