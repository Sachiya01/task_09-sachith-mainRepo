module "dev_public_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-dev_public_sg"
  vpc_id = module.dev_vpc.vpc_id
  ingress_rules = var.public_sg_ingress_rules
  egress_rules = var.public_sg_egress_rules
}