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

variable "firewalls" {
  type = list(object({
    name  = string
    ports = list(string)
    tags  = string
  }))
  description = <<-DESC
    Input should be in following manner
    firewalls = [
      {
        name : "master",,
        ports : ["22","33","100-10000"],
        tags : "master_node",
      },
      {
        name : "worker",
        ports: ["7852","5454","10002-10025"],
        tags : "worker_node",
      },
    ]
  DESC
}