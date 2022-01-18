resource "google_compute_ssl_certificate" "default" {
  name_prefix = "main"
  project     = google_project.project.project_id
  private_key = var.ssl_key
  certificate = var.ssl_certificate

  lifecycle {
    # Create new replacement object before destroying the old object
    create_before_destroy = true
  }
}
