provider "alicloud" {
  profile     = var.profile
//  region      = var.region
}

terraform {
  backend "remote" {
    organization = "dkatalis"

    workspaces {
      name = "network"
    }
  }
}
