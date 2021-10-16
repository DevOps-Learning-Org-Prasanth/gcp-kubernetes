locals {
  instances = [for instance in var.instances: "${var.zone}/${instance}"]
}