module "public_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-pritunl_sg"
  vpc_id = module.shared_vpc.vpc_id
  ingress_rules = var.public_sg_ingress_rules
  egress_rules = var.public_sg_egress_rules
}