# vpc
module "vpc" {
  source = "./modules/network_subnet"
}

# loadbalancer
module "loadbalancer" {
  source = "./modules/loadbalancer"
}

# master node
module "master_node" {
  source   = "./modules/linux_servers"
  tiercode = "mtr"
}

# worker nodes
module "worker_node" {
  source   = "./modules/linux_servers"
  tiercode = "wkr"
  count    = 2
}