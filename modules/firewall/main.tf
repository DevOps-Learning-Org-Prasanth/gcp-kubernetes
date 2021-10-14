resource "google_compute_firewall" "inbound" {
  for_each = { for firewall in var.firewalls : firewall.name => firewall }
  name     = "open-tcp-${each.value.name}-inbound"
  network  = "kubernetes"
  allow {
    protocol = "tcp"
    ports    = each.value.ports
  }
  target_tags = [each.value.tags]
  direction   = "INGRESS"
}

resource "google_compute_firewall" "outbound" {
  for_each = { for firewall in var.firewalls : firewall.name => firewall }
  name     = "open-tcp-${each.value.name}-outbound"
  network  = "kubernetes"
  allow {
    protocol = "tcp"
    ports    = each.value.ports
  }
  target_tags = [each.value.tags]
  direction   = "EGRESS"
}