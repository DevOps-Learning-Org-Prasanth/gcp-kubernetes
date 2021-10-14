subnets = [
  {
    name : "kubecluster",
    cidr : "10.255.43.0/24",
  },
  {
    name : "gateway",
    cidr : "10.255.44.0/24",
  }
]

firewalls = [
  {
    name : "master",
    ports : ["6443", "2379", "2380", "10250", "10251", "10252", "10255"],
    tags : "master_node",
  },
  {
    name : "worker",
    ports : ["6873", "10250", "10255", "3000-32767"],
    tags : "worker_node",
  },
  {
    name : "public",
    port : ["30000-30100"],
    tags : "public_access",
  },
  {
    name : "ssh",
    port : ["22"],
    tags : "ssh_access",
  }
]