locals {
  default_tags = ["default", "public"]
  tags         = concat(var.tags, local.default_tags)
  instances    = [for i in range(var.server_count) : "us-1c-${var.tiercode}-vm${i}"]
}