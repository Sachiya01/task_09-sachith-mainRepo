module "prod_vpc" {
  source = "../../modules/VPC"

  name = "${var.common_name}-prod_vpc"
  cidr_block = var.vpc_cidr
  environment = var.environment
}