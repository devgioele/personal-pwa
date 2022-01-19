locals {
  services = toset(var.gcp_enabled_apis)
}

resource "random_id" "project_id" {
  byte_length = 4
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.project_id.hex
  billing_account = var.gcp_billing_account
  org_id          = var.gcp_org_id
}

# Services and APIs enabled within the new project
resource "google_project_service" "service" {
  for_each           = local.services
  project            = google_project.project.project_id
  service            = each.value
}

# Wait after enabling APIs, because they result as created before the propagation of their effect is complete
resource "time_sleep" "wait_api_enabling" {
  depends_on = [google_project_service.service]

  create_duration = "30s"
}

module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.0"
  project_id    = google_project.project.project_id
  names         = ["github-actions"]
  display_name  = "GitHub Actions Service Account"
  generate_keys = true
  project_roles = [
    "${google_project.project.project_id}=>roles/editor",
    "${google_project.project.project_id}=>roles/compute.admin",
  ]

}

output "gcp_creds" {
  sensitive = true
  value     = base64encode(module.service_accounts.key)
}

output "project_id" {
  value = google_project.project.project_id
}
