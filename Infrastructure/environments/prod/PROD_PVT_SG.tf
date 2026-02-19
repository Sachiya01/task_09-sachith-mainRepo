module "prod_private_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-prod_private_sg"
  vpc_id = module.prod_vpc.vpc_id
  ingress_rules = [
    for rule in var.private_sg_ingress_rules : merge(
  rule,                                    
  rule.source_sg == "alb" ? {sg_ids = [module.prod_alb_sg.sg_id] } : {}
)

  ]
  egress_rules = var.private_sg_egress_rules
}