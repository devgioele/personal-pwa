# Project ID = project_name + (random ID of 4 chars)
# To not exceed the limit of 30 chars, the project name
# cannot be longer than 26 chars.
project_name              = "personal-pwa-1"
gcp_compute_name          = "tf-compute-1"
gcp_compute_machine_type  = "e2-medium"
gcp_compute_zone          = "europe-west6-a"
gcp_compute_image         = "ubuntu-minimal-2110-impish-v20220111"
gcp_compute_setup         = "setup.sh"
gcp_service_account_email = "terraform@devgio-terraform-admin.iam.gserviceaccount.com"
gcp_service_account_name  = "Terraform service account"
gcp_enabled_apis          = ["compute.googleapis.com", "cloudresourcemanager.googleapis.com"]
