resource "google_compute_network" "winrm-test-2" {
  name = "winrm-test"
}
resource "google_compute_subnetwork" "winrm-test1" {
  name          = "winrm-test1"
  ip_cidr_range = "192.168.20.0/24"
  network       = "${google_compute_network.winrm-test-2.name}"
  description   = "winrm-test1"
  region        = "asia-northeast1"
}
