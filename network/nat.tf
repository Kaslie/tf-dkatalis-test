resource "alicloud_nat_gateway" "enhanced" {
  depends_on       = [module.vpc]
  vpc_id           = module.vpc.this_vpc_id
  nat_gateway_name = "nat-gateway"
  payment_type     = "PayAsYouGo"
  vswitch_id       = join(",", module.vpc.this_vswitch_ids)
  nat_type         = "Enhanced"
}
