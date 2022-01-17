resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name = "default-network"
}