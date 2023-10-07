data "cloudinit_config" "az_linux_vm_cloud_config" {
  gzip          = true
  base64_encode = true
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/yaml/linux-cloud-config.yaml", {
      runner_version    = var.runner_version,
      RUNNER_TOKEN      = var.RUNNER_TOKEN,
      REPO_TOKEN        = var.REPO_TOKEN,
      ARTIFACTORY_TOKEN = var.ARTIFACTORY_TOKEN,
      LABELS            = var.LABELS,
      RUNNER_GROUP      = var.RUNNER_GROUP,
      ENT               = var.enterprise,
      DOCKER_REGISTRY = var.DOCKER_REGISTRY,
      DOCKER_USERNAME = var.DOCKER_USERNAME
    })
  }
}