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
  depends_on = [time_sleep.wait_api_enabling]

  name    = "default-network"
  project = google_project.project.project_id
}

resource "google_compute_address" "static" {
  depends_on = [time_sleep.wait_api_enabling]

  name = "ipv4-address"
  project = google_project.project.project_id
  address_type = "EXTERNAL"
}

resource "google_compute_ssl_certificate" "default" {
  depends_on = [time_sleep.wait_api_enabling]

  name_prefix = "main"
  project     = google_project.project.project_id
  private_key = var.ssl_key
  certificate = var.ssl_certificate

  lifecycle {
    # Create new replacement object before destroying the old object
    create_before_destroy = true
  }
}