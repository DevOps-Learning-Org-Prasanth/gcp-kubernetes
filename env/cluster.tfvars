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
    priority : 1001,
  },
  {
    name : "worker",
    ports : ["6873", "10250", "10255", "3000-32767"],
    tags : "worker",
    priority : 1002,
  },
  {
    name : "public",
    ports : ["30000-30002"],
    tags : "public",
    priority : 1003,
  },
  {
    name : "default",
    ports : ["22", "443", "8080", "80"],
    tags : "default",
    priority : 1000,
  }
]