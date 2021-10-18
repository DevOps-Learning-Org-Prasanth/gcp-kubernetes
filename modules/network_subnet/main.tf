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

resource "google_compute_router" "main" {
  name    = "${var.region}-${google_compute_network.main.name}-nat-router"
  network = google_compute_network.main.name
  region  = var.region
}

resource "google_compute_router_nat" "main" {
  name                               = "${var.region}-${google_compute_network.main.name}-nat-gateway"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  router                             = google_compute_router.main.name
  region                             = var.region
}