#Coment all on first terraform apply

data "aws_vpc_peering_connection" "shared_to_dev" {
  filter {
    name   = "tag:Name"
    values = ["shared-to-dev"]
  }
}

data "terraform_remote_state" "shared" {
  backend = "s3"

  config = {
    bucket = "task09-sachith-tfbackends"
    key = "shared/terraform.tfstate"
    region = "us-east-1"
  }
}

#Peering route from dev to shared - Comment all on first terraform apply

resource "aws_route" "dev1_to_shared" {
  route_table_id            = module.private_subnet_1a.RT_ids
  destination_cidr_block    = data.terraform_remote_state.shared.outputs.shared_vpc_cidr
  vpc_peering_connection_id = data.aws_vpc_peering_connection.shared_to_dev.id
}

resource "aws_route" "dev2_to_shared" {
  route_table_id            = module.private_subnet_1b.RT_ids
  destination_cidr_block    = data.terraform_remote_state.shared.outputs.shared_vpc_cidr
  vpc_peering_connection_id = data.aws_vpc_peering_connection.shared_to_dev.id
}
