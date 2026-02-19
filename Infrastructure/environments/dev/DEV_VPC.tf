module "dev_vpc" {
  source = "../../modules/VPC"

  name = "${var.common_name}-dev_vpc"
  cidr_block = var.vpc_cidr
  environment = var.environment
}