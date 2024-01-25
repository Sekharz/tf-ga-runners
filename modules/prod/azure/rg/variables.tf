variable "rg_location" {
  type    = string
  default = "East US"
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