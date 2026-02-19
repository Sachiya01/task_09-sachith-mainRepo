module "dev_alb_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-dev_alb_sg"
  vpc_id = module.dev_vpc.vpc_id
  ingress_rules = var.alb_sg_ingress_rules
  egress_rules = var.alb_sg_egress_rules
}
