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
  tags = {
    Name = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}