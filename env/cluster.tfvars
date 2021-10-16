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
  },
  {
    name : "worker",
    ports : ["6873", "10250", "10255", "3000-32767"],
    tags : "worker",
  },
  {
    name : "public",
    ports : ["30000-30002"],
    tags : "public",
  },
  {
    name : "default",
    ports : ["22", "443", "8080", "80"],
    tags : "default",
  }
]