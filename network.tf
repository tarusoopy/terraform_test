resource "google_compute_network" "winrm-test" {
  name = "winrm-test"
}
resource "google_compute_subnetwork" "winrm-test1" {
  name          = "winrm-test1"
  ip_cidr_range = "192.168.20.0/24"
  network       = "${google_compute_network.winrm-test.name}"
  description   = "winrm-test1"
  region        = "asia-northeast1"
}
