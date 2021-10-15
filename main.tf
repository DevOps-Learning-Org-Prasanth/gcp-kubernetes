# vpc
module "vpc" {
  source  = "./modules/network_subnet"
  subnets = var.subnets
  region  = local.region
}

# firewall
module "firewall" {
  source    = "./modules/firewall"
  firewalls = var.firewalls
}

# loadbalancer
# module "loadbalancer" {
# source = "./modules/loadbalancer"
# }

# master node
module "master_node" {
  source           = "./modules/linux_servers"
  tiercode         = "mtr"
  count            = 1
  subnet_self_link = module.vpc["kubecluster"].id
  zone             = local.zone
  tags             = ["master"]
  machine_type     = local.machine_type
}

# worker nodes
module "worker_node" {
  source           = "./modules/linux_servers"
  tiercode         = "wkr"
  count            = 2
  subnet_self_link = module.vpc["kubecluster"].id
  zone             = local.zone
  tags             = ["worker"]
  machine_type     = local.machine_type
}