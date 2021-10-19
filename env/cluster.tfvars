subnets = [
  {
    name : "kubecluster",
    cidr : "10.255.43.0/24",
  }
]

firewalls = [
  {
    name : "master",
    ports : ["6443", "2379", "2380", "10250", "10251", "10252", "10255"],
    tags : "master",
    ingress_priority : 1001,
    egress_priority : 1005,
  },
  {
    name : "worker",
    ports : ["6873", "10250", "10255", "3000-32767"],
    tags : "worker",
    ingress_priority : 1002,
    egress_priority : 1006,
  },
  {
    name : "public",
    ports : ["30000-30010"],
    tags : "public",
    ingress_priority : 1003,
    egress_priority : 1007,
  },
  {
    name : "default",
    ports : ["22", "443", "8080", "80"],
    tags : "default",
    ingress_priority : 1000,
    egress_priority : 1004,
  }
]