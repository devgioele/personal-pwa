data "google_compute_zones" "available" {
  project = google_project.project.project_id
}

resource "google_compute_instance" "default" {
  project      = google_project.project.project_id
  zone         = data.google_compute_zones.available.names[0]
  name         = "tf-compute-1"
  machine_type = var.gcp_compute_machine_type

  boot_disk {
    initialize_params {
      image = var.gcp_compute_image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  depends_on = [google_project_service.service]
}

# Output self_link to make it easier to ssh into the created instance
output "instance_id" {
  value = google_compute_instance.default.self_link
}