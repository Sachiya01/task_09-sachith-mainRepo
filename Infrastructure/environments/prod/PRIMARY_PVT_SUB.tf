module "private_subnet_1a" {
  source = "../../modules/Subnet"
  vpc_id = module.prod_vpc.vpc_id
  cidr_block = var.pvt_sub_cidr[0]
  az = var.aws_az[0]
  public = false
  name = "${var.common_name}-prod_pvt_sub1a"
  environment = var.environment
  nat_gw_id  = module.ngw1.ngw_id
}