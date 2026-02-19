resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  auto_accept   = true
}

resource "aws_route" "requester_route" {
  route_table_id         = var.requester_route_table_id
  destination_cidr_block = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "accepter_route" {
  route_table_id         = var.accepter_route_table_id
  destination_cidr_block = var.requester_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
