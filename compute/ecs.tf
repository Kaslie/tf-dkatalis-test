resource "random_integer" "vswitch_index" {
  max = 2
  min = 0
}

module "ecs_cluster" {
  source  = "alibaba/ecs-instance/alicloud"

  number_of_instances = 1

  name                        = "dkatalis"
  use_num_suffix              = true
  image_id                    = data.alicloud_images.ubuntu.ids.0
  instance_type               = "ecs.sn1ne.large"
  vswitch_id                  = data.terraform_remote_state.vpc.outputs.vpc.this_vswitch_ids[random_integer.vswitch_index.result]
  security_group_ids          = [data.terraform_remote_state.vpc.outputs.vpc.this_resource_group_id]
  associate_public_ip_address = true
  internet_max_bandwidth_out  = 10

  system_disk_category = "cloud_ssd"
  system_disk_size     = 50

  tags = {
    Created       = "Terraform"
    Environment   = "production"
  }
}
