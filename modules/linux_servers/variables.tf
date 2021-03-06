variable "tags" {
  type        = list(string)
  description = "Network tags to be applied onto vm. ssh,outbound tags are included by default"
}

variable "tiercode" {
  type        = string
  description = "tier code of the machine"
}

variable "server_count" {
  type        = number
  description = "Number of machines to create"
}
variable "machine_type" {
  type        = string
  description = "size of the vm to create."
}

variable "subnet_self_link" {
  type        = string
  description = "name of the subnet where the vm should be created"
}

variable "zone" {
  type        = string
  description = "region where the resource should be created"
}

variable "policy_name" {
  type        = string
  description = "Policy name of the node"
}

variable "policy_group" {
  type        = string
  description = "policy group of node"
}