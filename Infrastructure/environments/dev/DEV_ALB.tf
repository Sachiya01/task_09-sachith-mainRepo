module "ALB" {
  source = "../../modules/ALB"
  name = "${var.common_name1}-dev-alb"
  public_subnets = [module.public_subnet_1a.ids, module.public_subnet_1b.ids]
  alb_sg = module.dev_alb_sg.sg_id
  vpc_id = module.dev_vpc.vpc_id
}