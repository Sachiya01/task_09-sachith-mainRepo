module "shared_prod_peer" {
  source = "../../modules/VPC_Peering"

  name = "shared-to-prod"
  requester_vpc_id = module.shared_vpc.vpc_id
  accepter_vpc_id = data.terraform_remote_state.prod.outputs.prod_vpc_id
  auto_accept = true
  requester_route_table_id = [module.private_subnet.RT_ids]
  accepter_cidr = data.terraform_remote_state.prod.outputs.prod_vpc_cidr
  requester_cidr = module.shared_vpc.cidr_block
}

data "terraform_remote_state" "prod" {
  backend = "s3"

  config = {
    bucket = "task09-sachith-tfbackends"
    key = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
