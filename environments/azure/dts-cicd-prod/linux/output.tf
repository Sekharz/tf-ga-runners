output "az_vmss_ids" {
  value = module.az_linux_vms.az_vmss_id
}

output "prefix_ip_cidr" {
  value = module.az_linux_vms.prefix_ip_cidr
}