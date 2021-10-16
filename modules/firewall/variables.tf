variable "firewalls" {
  type = list(object({
    name             = string
    ports            = list(string)
    tags             = string
    ingress_priority = number
    egress_priority  = number
  }))
  description = <<-DESC
    Input should be in following manner
    firewalls = [
      {
        name : "master",,
        ports : ["22","33","100-10000"],
        tags : "master_node",
        ingress_priority : 1000,
        egress_priority : 1000,
      },
      {
        name : "worker",
        ports: ["7852","5454","10002-10025"],
        tags : "worker_node",
        ingress_priority : 1000,
        egress_priority : 1000,
      },
    ]
  DESC
}