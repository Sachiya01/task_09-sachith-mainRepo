module "public_subnet_1b" {
  source = "../../modules/Subnet"

  vpc_id = module.prod_vpc.vpc_id
  cidr_block = var.pub_sub_cidr[1]
  az = var.aws_az[1]
  public = true
  name = "${var.common_name}-prod_pub-sub1b"
  environment = var.environment
  igw_id    = module.igw.igw_id 
}