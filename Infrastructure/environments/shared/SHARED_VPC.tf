module "shared_vpc" {
  source = "../../modules/VPC"

  name = "${var.common_name}-shared_vpc"
  cidr_block = var.vpc_cidr
  environment = var.environment
}
