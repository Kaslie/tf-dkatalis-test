module "slb" {
  source      = "alibaba/slb/alicloud"

  name        = "wordpress-slb"

  tags = {
    Created               = "Terraform"
    Environment           = "production"
    type                  = "wordpress-slb"
  }
}