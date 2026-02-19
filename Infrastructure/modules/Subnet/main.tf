resource "aws_subnet" "this" {
  
    vpc_id     = var.vpc_id
    cidr_block = var.cidr_block
    map_public_ip_on_launch = var.public
    availability_zone = var.az

     tags = {
      Name = var.name
      Environment = var.environment
    }

}

# Route table for public or private
resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  /* route {
    cidr_block = "0.0.0.0/0"

    # Conditional: use IGW for public, NAT GW for private
    gateway_id    = var.public ? var.igw_id : null
    nat_gateway_id = var.public ? null : var.nat_gw_id
  }
 */
  tags = {
    Name = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}