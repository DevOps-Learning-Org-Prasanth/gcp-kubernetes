# vpc
module "vpc" {
  source = "./modules/network_subnet"
  subnets = var.subnets
}

# firewall
module "firewall"{
  source = "./modules/firewall"
  firewalls = var.firewalls
}

# loadbalancer
# module "loadbalancer" {
  # source = "./modules/loadbalancer"
# }

# master node
# module "master_node" {
  # source   = "./modules/linux_servers"
  # tiercode = "mtr"
# }

# worker nodes
# module "worker_node" {
  # source   = "./modules/linux_servers"
  # tiercode = "wkr"
  # count    = 2
# }