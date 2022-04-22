data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "dkatalis"
    workspaces = {
      name = "network"
    }
  }
}