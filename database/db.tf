module "mysql" {
  source                  = "terraform-alicloud-modules/rds/alicloud"

  engine                  = "MySQL"
  engine_version          = "8.0"
  vswitch_id              = join(",", data.terraform_remote_state.vpc.outputs.vpc.this_vswitch_ids)
  instance_storage        = 20
  period                  = 1
  instance_type           = "rds.mysql.s2.large"
  instance_name           = "wordpress-instance"
  instance_charge_type    = "Postpaid"
  security_ips            = [ "0.0.0.0.0/0" ]

  tags = {
    Created               = "Terraform"
    Environment           = "production"
    type                  = "wordpress-db"
  }

  account_name = var.db_name
  password     = var.db_password
  type         = "Normal"
  privilege    = "ReadWrite"
  databases = [
    {
      name          = var.db_name
      character_set = "utf8"
      description   = "MySQL DB"
    }
  ]
}
