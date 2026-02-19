module "private_subnet_1b" {
  source = "../../modules/Subnet"
  vpc_id = module.prod_vpc.vpc_id
  cidr_block = var.pvt_sub_cidr[1]
  az = var.aws_az[1]
  public = false
  name = "${var.common_name}-prod_pvt_sub1b"
  environment = var.environment
  nat_gw_id  = module.ngw2.ngw_id
}