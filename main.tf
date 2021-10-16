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
  depends_on = [
    module.vpc
  ]
}

# loadbalancer
# module "loadbalancer" {
  # source    = "./modules/loadbalancer"
  # instances = concat(module.master_node.instances, module.worker_node.instances)
  # depends_on = [
    # module.master_node, module.worker_node
  # ]
  # ports = lookup({ for firewall in var.firewalls : firewall.name => firewall.ports }, "public")
  # zone  = local.zone
  # # health_check_port = "30000"
# }

# master node
module "master_node" {
  source           = "./modules/linux_servers"
  tiercode         = "mtr"
  server_count     = 1
  subnet_self_link = module.vpc.subnets["kubecluster"].id
  zone             = local.zone
  tags             = ["master"]
  machine_type     = local.machine_type
  depends_on = [
    module.firewall
  ]
}

# worker nodes
# module "worker_node" {
  # source           = "./modules/linux_servers"
  # tiercode         = "wkr"
  # server_count     = 2
  # subnet_self_link = module.vpc.subnets["kubecluster"].id
  # zone             = local.zone
  # tags             = ["worker"]
  # machine_type     = local.machine_type
  # depends_on = [
    # module.firewall
  # ]
# }