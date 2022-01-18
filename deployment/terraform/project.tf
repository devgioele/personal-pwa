locals {
  services   = toset(var.gcp_enabled_apis)
  project_id = "${var.project_name}${var.project_suffix}"
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = local.project_id
  billing_account = var.gcp_billing_account
  org_id          = var.gcp_org_id
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
    "${google_project.project.project_id}=>roles/editor",
    "${google_project.project.project_id}=>roles/compute.admin",
  ]
  generate_keys = true
}

output "gcp_creds" {
  sensitive = true
  value     = base64encode(module.service_accounts.key)
}

output "project_id" {
  value = google_project.project.project_id
}
