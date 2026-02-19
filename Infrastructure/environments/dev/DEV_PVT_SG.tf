module "dev_private_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-dev_private_sg"
  vpc_id = module.dev_vpc.vpc_id
  ingress_rules = [
    for rule in var.private_sg_ingress_rules : merge(
  rule,                                    
  rule.source_sg == "alb" ? {sg_ids = [module.dev_alb_sg.sg_id] } : {}
)

  ]
  egress_rules = var.private_sg_egress_rules
}