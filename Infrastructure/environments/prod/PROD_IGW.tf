module "igw" {
  source      = "../../modules/IGW"
  vpc_id      = module.prod_vpc.vpc_id
  name        = "${var.common_name}-prod-igw"
  tags        = {
    Environment = "prod"
    Project     = "myapp"
  }
  
}

resource "aws_route" "public_default" {
  route_table_id         = module.public_subnet_1a.RT_ids
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw.igw_id
}

resource "aws_route" "public_default_2" {
  route_table_id         = module.public_subnet_1b.RT_ids
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw.igw_id
}