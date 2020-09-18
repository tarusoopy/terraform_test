resource "google_compute_instance" "winrmtest-1" {
  name         = "winrmtest-1"
  machine_type = "g1-small"
  zone         = "asia-northeast1-b"
  description  = "winrmtest-1"
  tags         = ["http-server", "https-server"]

  boot_disk {
    image = "gce-uefi-images/centos-7"
    type        = "local-ssd"
    size        = 10
    scratch     = true
    auto_delete = true
  }

  network_interface {
    network = "winrm-test"
    subnetwork = "${google_compute_subnetwork.winrm-test1.name}"
    access_config {
      // Ephemeral IP
    }

  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro", "bigquery", "monitoring"]
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }
}
