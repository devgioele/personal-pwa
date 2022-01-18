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

locals {
  services = toset(var.gcp_enabled_apis)
}

# Services and APIs enabled within the new project
resource "google_project_service" "service" {
  for_each           = local.services
  project            = google_project.project.project_id
  service            = each.value
}

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.0"
  project_id    = google_project.project.project_id
  names         = ["github-actions"]
  display_name  = "GitHub Actions Service Account"
  project_roles = [
    "${google_project.project.project_id}=>roles/viewer",
    "${google_project.project.project_id}=>roles/compute.admin",
  ]
  generate_keys = true
}

output "github_actions_key" {
  sensitive = true
  value     = base64encode(module.service_accounts.key)
}

output "project_id" {
  value = google_project.project.project_id
}
