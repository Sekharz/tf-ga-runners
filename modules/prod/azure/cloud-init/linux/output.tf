output "az_linux_vm_cloud_config_rendered" {
  value = data.cloudinit_config.az_linux_vm_cloud_config.rendered
}