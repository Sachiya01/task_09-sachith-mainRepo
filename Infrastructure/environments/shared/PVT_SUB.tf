module "private_subnet" {
  source = "../../modules/Subnet"
  vpc_id = module.shared_vpc.vpc_id
  cidr_block = var.pvt_sub_cidr
  az = var.aws_az
  public = false
  name = "${var.common_name}-pvt_sub"
  environment = var.environment
  nat_gw_id  = module.ngw.ngw_id
}

resource "aws_route" "private_default" {
  route_table_id         = module.private_subnet.RT_ids
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.ngw.ngw_id
}

