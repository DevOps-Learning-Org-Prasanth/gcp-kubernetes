variable "firewalls" {
  type = list(object({
    name     = string
    ports    = list(string)
    tags     = string
    priority = number
  }))
  description = <<-DESC
    Input should be in following manner
    components = [
      {
        name : "master",,
        ports : ["22","33","100-10000"],
        tags : "master_node",
        priority : 1000,
      },
      {
        name : "worker",
        ports: ["7852","5454","10002-10025"],
        tags : "worker_node",
        priority : 1001.
      },
    ]
  DESC
}