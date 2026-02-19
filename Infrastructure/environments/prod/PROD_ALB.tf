module "prod_alb" {
  source = "../../modules/ALB"
  name = "${var.common_name1}-prod-alb"
  public_subnets = [module.public_subnet_1a.ids, module.public_subnet_1b.ids]
  alb_sg = module.prod_alb_sg.sg_id
  vpc_id = module.prod_vpc.vpc_id
}