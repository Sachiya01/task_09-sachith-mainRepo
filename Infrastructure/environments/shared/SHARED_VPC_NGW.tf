/* resource "aws_eip" "sachith_tf_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.common_name}-nat-eip"
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.sachith_tf_eip.id
  subnet_id     = module.public_subnet.ids[0]  
  tags = {
    Name = "${var.common_name}-nat"
  }
} */

module "ngw" {
  source = "../../modules/NGW"

  name = "${var.common_name}-nat"
  subnet_id = module.public_subnet.ids
}
