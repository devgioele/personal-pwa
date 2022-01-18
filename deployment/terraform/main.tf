terraform {
  required_providers {
    google = {
      version = "~> 4.0.0"
    }
  }
}

// Google Cloud Platform
provider "google" {
  region      = var.gcp_region
  credentials = var.gcp_creds
}
