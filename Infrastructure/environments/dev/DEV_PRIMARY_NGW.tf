
  module "ngw1" {
  source = "../../modules/NGW"

  name = "${var.common_name}-nat1"
  subnet_id = module.public_subnet_1a.ids
}

resource "aws_route" "private_default" {
  route_table_id         = module.private_subnet_1a.RT_ids
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.ngw1.ngw_id
}