provider "alicloud" {
  profile     = var.profile
}

terraform {
  backend "remote" {
    organization = "dkatalis"

    workspaces {
      name = "database"
    }
  }
}