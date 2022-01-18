# Project ID = project_name + (random ID of 4 chars)
# To not exceed the limit of 30 chars, the project name
# cannot be longer than 26 chars.
variable "project_name" {
  type = string
}

# See GCP machine types here: https://cloud.google.com/compute/docs/machine-types
variable "gcp_compute_machine_type" {
  type = string
}

variable "gcp_compute_zone" {
  type = "string"
}

# See a list of possible images with `gcloud compute images list`
variable "gcp_compute_image" {
  type = string
}

variable "gcp_compute_setup" {
  type = string
}

variable "gcp_service_account_email" {
  type = string
}

variable "gcp_service_account_name" {
  type = string
}

variable "gcp_enabled_apis" {
  description = "The list of APIs to activate within the project"
  type = list(string)
}

### Variables pulled from Terraform Cloud

variable "gcp_billing_account" {
  type = string
}

variable "gcp_org_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_creds" {
  type = string
}

variable "ssl_certificate" {
  type = string
}

variable "ssl_key" {
  type = string
}
