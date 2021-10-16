# variable "region" {
# type        = string
# description = "Region where subnet should be created"
# }

variable "ports" {
  type        = list(string)
  description = "ports required for forwarding rule"
}

variable "instances" {
  type        = list(string)
  description = "Instances to be included in the target pool"
}