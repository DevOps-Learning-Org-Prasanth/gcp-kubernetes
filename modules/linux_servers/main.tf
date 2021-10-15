resource "google_compute_instance" "main" {
  count = var.server_count
  name  = "us-1c-${var.tiercode}-vm${count.index}"
  zone  = var.zone
  tags  = local.tags

  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }

  network_interface {
    subnetwork = var.subnet_self_link
  }
}