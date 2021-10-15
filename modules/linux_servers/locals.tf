locals {
  default_tags = ["ssh", "public"]
  tags         = concat(var.tags, local.default_tags)
}