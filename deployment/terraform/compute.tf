data "google_compute_zones" "available" {
  depends_on = [time_sleep.wait_api_enabling]

  project = google_project.project.project_id
}

resource "google_compute_instance" "default" {
  project      = google_project.project.project_id
  zone         = var.gcp_compute_zone
  name         = var.gcp_compute_name
  machine_type = var.gcp_compute_machine_type
  # Allow Terraform to stop the instance to update its properties
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.gcp_compute_image
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  # Network tags
  tags = ["web", "http-server", "https-server"]

  # Causes a recreation of the resource if changed
  metadata_startup_script = file(var.gcp_compute_setup)
  depends_on              = [google_project_service.service]
}

output "ip_address" {
  value = google_compute_address.static.address
}

output "instance_name" {
  value = google_compute_instance.default.name
}

output "compute_zone" {
  value = var.gcp_compute_zone
}
