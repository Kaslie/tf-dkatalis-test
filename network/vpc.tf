module "vpc" {
  source  = "terraform-alicloud-modules/network-with-nat/alicloud"

  create_vpc          = true
  vpc_name            = "dkatalis"
  vpc_cidr            = "10.10.0.0/16"

  availability_zones  = ["ap-southeast-5a", "ap-southeast-5b", "ap-southeast-5c"]
  vswitch_cidrs       = ["10.10.1.0/24", "10.10.20.0/24", "10.10.40.0/24"]
  vswitch_tags = {
    Created               = "Terraform"
    Environment           = "production"
    type                  = "wordpress-vswitch"
  }

  vpc_tags = {
    terraform   = true
  }

  # NAT
  create_nat    = true
  nat_name      = "nat-gateway"

  # EIP
  create_eip    = true
  eip_name      = "eip-nat"
  eip_isp       = "BGP"
  eip_tags = {
    Created               = "Terraform"
    Environment           = "production"
    type                  = "wordpress-eip"
  }
}