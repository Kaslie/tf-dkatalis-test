data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "dkatalis"
    workspaces = {
      name = "network"
    }
  }
}

data "alicloud_images" "ubuntu" {
  most_recent = true
  name_regex  = "^ubuntu_18.*64"
}