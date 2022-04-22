module "autoscaling" {
  source                      = "terraform-alicloud-modules/autoscaling/alicloud"

  // Autoscaling Group
  scaling_group_name          = "wordpress-autoscaling"
  min_size                    = 1
  max_size                    = 2
  vswitch_ids                 = data.terraform_remote_state.vpc.outputs.vpc.this_vswitch_ids

  // Autoscaling Configuration
  image_id                    = "centos_7_03_64_20G_alibase_20170818.vhd"
  instance_types              = [var.instance_type["cpu-2-4"]]
  security_group_ids          = [data.terraform_remote_state.vpc.outputs.vpc.this_resource_group_id]
  scaling_configuration_name  = "wordpress-autoscaling-conf"
  internet_max_bandwidth_out  = 1
  instance_name               = "wordpress"

  slb_tags                    = module.slb.this_slb_tags

  tags = {
    Created               = "Terraform"
    Environment           = "production"
    type                  = "wordpress-autoscale-ecs"
  }

  force_delete = true

  data_disks = [
    {
      size                    = 20
      category                = "cloud_ssd"
    },
    {
      size                    = 20
      category                = "cloud_ssd"
  }]
}
