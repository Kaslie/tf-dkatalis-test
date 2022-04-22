module "nat-gateway" {
  source = "terraform-alicloud-modules/nat-gateway/alicloud"

  create = true
  vpc_id = module.vpc.this_vpc_id
  name   = "nat-gateway"

  // Create eip and bind them with nat gateway
  create_eip    = true
  number_of_eip = 1
  eip_name      = "eip-nat-lb"
  eip_isp       = "BGP"
  eip_tags = {
    Created               = "Terraform"
    Environment           = "production"
    type                  = "wordpress-eip"
  }
}
