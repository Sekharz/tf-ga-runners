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

variable "enterprise" {
  type = string
}

variable "DOCKER_REGISTRY" {
  type = string
}

variable "DOCKER_USERNAME" {
  type = string
}