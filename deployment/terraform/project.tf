resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.id.hex
  billing_account = var.gcp_billing_account
  org_id          = var.gcp_org_id
}

# Services and APIs enabled within the new project
resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com"
  ])
  service            = each.key
  project            = google_project.project.project_id
  disable_on_destroy = false
}

# Display the project ID for later reference
output "project_id" {
  value = google_project.project.project_id
}
