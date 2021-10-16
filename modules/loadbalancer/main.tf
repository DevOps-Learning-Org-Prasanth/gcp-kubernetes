# target pool
resource "google_compute_target_pool" "main" {
  name          = "kube-cluster-pool"
  instances     = var.instances
  health_checks = [google_compute_health_check.tcp.id]
}

# health check
resource "google_compute_health_check" "tcp" {
  name = "tcp-health-check"
  dynamic "tcp_health_check" {
    for_each = toset(local.health_check_ports)
    content {
      port = tcp_health_check.value
    }
  }
}

# forwarding rule
resource "google_compute_forwarding_rule" "main" {
  name                  = "kube-lb"
  ip_protocol           = "TCP"
  port_range            = var.ports[0]
  target                = google_compute_target_pool.main.id
  load_balancing_scheme = "EXTERNAL"
  allow_global_access   = true
}
