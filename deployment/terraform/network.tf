resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  project = google_project.project.project_id
  network = google_compute_network.default.name

  # HTTP and HTTPS
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  # SSH
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["web"]
}

resource "google_compute_network" "default" {
  name    = "default-network"
  project = google_project.project.project_id
}
