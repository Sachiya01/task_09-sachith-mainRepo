module "dev_ecs" {
  source            = "../../modules/ECS"
  
  cluster_name      = "${var.common_name}-dev-ecs-cluster"
  family            = var.family
  service_name      = "${var.common_name}-dev_service"
  image             = var.image
  execution_role    = data.aws_iam_role.ecsTaskExecutionRole.arn

  private_subnets   = [module.private_subnet_1a.ids, module.private_subnet_1b.ids]
  ecs_sg            = module.dev_private_sg.sg_id
  target_group_arn  = module.ALB.target_group_arn
}
