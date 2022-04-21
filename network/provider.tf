provider "alicloud" {
  profile     = var.profile
  region      = var.region
  access_key  = var.access_key
  secret_key  = var.secret_key
}

terraform {
  backend "remote" {
    organization = "dkatalis"

    workspaces {
      name = "network"
    }
  }
}
