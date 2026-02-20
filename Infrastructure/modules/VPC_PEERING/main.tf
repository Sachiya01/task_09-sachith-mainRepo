resource "aws_vpc_peering_connection" "this" {
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  auto_accept   = var.auto_accept

  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

# Routes in requester VPC
resource "aws_route" "requester_routes" {
  for_each = toset(var.requester_route_table_id)

  route_table_id              = each.value
  destination_cidr_block      = var.accepter_cidr
  vpc_peering_connection_id   = aws_vpc_peering_connection.this.id
}
/* 
# Routes in accepter VPC
resource "aws_route" "accepter_routes" {
  for_each = toset(var.accepter_route_table_id)

  route_table_id              = each.value
  destination_cidr_block      = var.requester_cidr
  vpc_peering_connection_id   = aws_vpc_peering_connection.this.id
} */