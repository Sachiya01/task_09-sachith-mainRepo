/* #Comment on first apply

resource "aws_vpc_peering_connection" "shared_to_dev" {
  vpc_id        = module.shared_vpc.vpc_id
  peer_vpc_id   = data.terraform_remote_state.dev.outputs.dev_vpc_id
  auto_accept   = true

  tags = {
    Name = "shared-to-dev"
  }
}


#Peering route - Comment on first terraform apply
resource "aws_route" "shared_to_dev" {
  route_table_id            = module.private_subnet.RT_ids
  destination_cidr_block    = data.terraform_remote_state.dev.outputs.dev_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.shared_to_dev.id
}

data "terraform_remote_state" "dev" {
  backend = "s3"

  config = {
    bucket = "task09-sachith-tfbackends"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
 */