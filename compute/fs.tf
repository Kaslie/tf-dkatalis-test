module "nas" {
    source                = "terraform-alicloud-modules/nas/alicloud"
//    protocol_type         = "NFS"
//    storage_type          = "Performance"
//    type                  = "Vpc"
    access_group_name     = "wordpress--access-group"
    source_cidr_ip        = data.terraform_remote_state.vpc.outputs.vpc.this_vpc_cidr_block

    vswitch_id            = data.terraform_remote_state.vpc.outputs.vpc.this_vswitch_ids[0]
}
