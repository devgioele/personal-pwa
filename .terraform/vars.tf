# Project ID = project_name + (random ID of 4 chars)
# To not exceed the limit of 30 chars, the project name
# cannot be longer than 26 chars.
variable "project_name" {
  default = "personal-pwa-1"
}

# See GCP machine types here: https://cloud.google.com/compute/docs/machine-types
variable "gcp_compute_machine_type" {
  default = "e2-medium"
}

# See a list of possible images with `gcloud compute images list`
variable "gcp_compute_image" {
  default = "ubuntu-minimal-2110-impish-v20220111"
}

# Variables pulled from Terraform Cloud

variable "gcp_billing_account" {}

variable "gcp_org_id" {}

variable "gcp_region" {}

variable "gcp_creds" {}