resource "google_compute_network" "main" {
  name                    = "kubernetes"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "main" {
  for_each      = { for subnet in var.subnets : subnet.name => subnet.cidr }
  name          = each.key
  ip_cidr_range = each.value
  network       = google_compute_network.main.id
  region        = var.region
}