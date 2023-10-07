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

variable "SUB2_rg_name" {
  type = string
}

variable "SUB2_sig_name" {
  type = string
}