data "google_service_account" "main" {
  account_id = "instance-sa"
}

resource "google_compute_instance" "main" {
  count = var.server_count
  name  = local.instances[count.index]
  zone  = var.zone
  tags  = local.tags

  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  allow_stopping_for_update = true
  network_interface {
    subnetwork = var.subnet_self_link
  }

  service_account {
    scopes = ["cloud-platform"]
    email = data.google_service_account.main.email
  }
}
