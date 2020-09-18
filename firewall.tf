resource "google_compute_firewall" "winrm-test" {
  name    = "winrm-test"
  network = "${google_compute_network.winrm-test.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "38080"]
  }

  target_tags = ["${google_compute_instance.winrm-test.tags}"]
}