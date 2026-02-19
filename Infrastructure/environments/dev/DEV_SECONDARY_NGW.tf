  module "ngw2" {
  source = "../../modules/NGW"

  name = "${var.common_name}-nat2"
  subnet_id = module.public_subnet_1b.ids
}

resource "aws_route" "private_default_2" {
  route_table_id         = module.private_subnet_1b.RT_ids
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.ngw2.ngw_id
}