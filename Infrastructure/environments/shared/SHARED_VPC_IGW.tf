


module "igw" {
  source      = "../../modules/IGW"
  vpc_id      = module.shared_vpc.vpc_id
  name        = "${var.common_name}-shared-igw"
  tags        = {
    Environment = "shared"
    Project     = "myapp"
  }
}