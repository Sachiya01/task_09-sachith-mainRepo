module "prod_public_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-prod_public_sg"
  vpc_id = module.prod_vpc.vpc_id
  ingress_rules = var.public_sg_ingress_rules
  egress_rules = var.public_sg_egress_rules
}