# Use Terraform Cloud (aka. remote runs)
terraform {
  backend "remote" {
    organization = "devgio"
    workspaces {
      name = "personal-pwa"
    }
  }
}