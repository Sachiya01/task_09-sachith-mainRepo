module "public_subnet" {
  source = "../../modules/Subnet"

  vpc_id = module.shared_vpc.vpc_id
  cidr_block = var.pub_sub_cidr
  az = var.aws_az
  public = true
  name = "${var.common_name}-pub_sub"
  environment = var.environment
  igw_id    = module.igw.igw_id
}

resource "aws_route" "public_default" {
  route_table_id         = module.public_subnet.RT_ids
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw.igw_id
}