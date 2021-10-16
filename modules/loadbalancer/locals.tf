locals {
  port_ranges        = split("-",var.ports[0])
  health_check_ports = [for port in range(tonumber(local.port_ranges[0]), tonumber(local.port_ranges[1])) : tostring(port)]
}