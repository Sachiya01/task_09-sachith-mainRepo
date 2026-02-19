module "public_subnet_1a" {
  source = "../../modules/Subnet"

  vpc_id = module.prod_vpc.vpc_id
  cidr_block = var.pub_sub_cidr[0]
  az = var.aws_az[0]
  public = true
  name = "${var.common_name}-prod_pub-sub1a"
  environment = var.environment
  igw_id    = module.igw.igw_id
}