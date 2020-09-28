resource "google_compute_address" "winrmtest-2" {
  name   = "winrmtest-2"
  region = "${var.region}"
}
resource "google_compute_instance" "winrmtest-2" {
  name         = "winrmtest-2"
  machine_type = "g1-small"
  zone         = "asia-northeast1-b"
  description  = "winrmtest-2"
  tags         = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image       = "gce-uefi-images/centos-7"
    }
  }

  network_interface {
    network = "winrm-test"
    subnetwork = "${google_compute_subnetwork.winrm-test1.name}"
    access_config {
      // Static external IP
      nat_ip = "${google_compute_address.winrmtest-2.address}"
    }

  }

  metadata_startup_script = "${file("./test.sh")}"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro", "bigquery", "monitoring"]
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }
}
