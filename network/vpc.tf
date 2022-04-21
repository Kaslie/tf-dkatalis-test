module "vpc" {
  source  = "alibaba/vpc/alicloud"

  create              = true
  vpc_name            = "dkatalis"
  vpc_cidr            = "10.10.0.0/16"
  resource_group_id   = "rg-acfmwvvtg5o****"

  availability_zones  = ["ap-southeast-5a", "ap-southeast-5b", "ap-southeast-5c"]
  vswitch_cidrs       = ["10.10.1.0/24", "10.10.20.0/24", "10.10.40.0/24"]

  vpc_tags = {
    terraform   = true
  }

  vswitch_tags    = {
    environment   = "production"
    profile       = "dkatalis=test"
  }
}