module "private_sg" {
  source = "../../modules/SG"
  name = "${var.common_name}-jenkins_sg"
  vpc_id = module.shared_vpc.vpc_id
  ingress_rules = [
    for rule in var.private_sg_ingress_rules : merge(
  rule,                                    
  rule.source_sg == "public" ? {           
    sg_ids = [module.public_sg.sg_id]
  } : {}                                    
)

  ]
  egress_rules = var.private_sg_egress_rules
}