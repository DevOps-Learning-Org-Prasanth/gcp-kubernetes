variable "subnets" {
  type = list(object({
    name = string
    cidr = string
  }))
  description = <<-DESC
    List of subnets to be created:
    format:
    {
      name : kubecluster,
      cidr : 10.0.20.0/24,
    }
  DESC
}

variable "region" {
  type        = string
  description = "Region where subnet should be created"
}