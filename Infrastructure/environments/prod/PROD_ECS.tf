module "prod_ecs" {
  source            = "../../modules/ECS"
  cluster_name      = "${var.common_name}-prod-ecs-cluster"
  family            = var.family
  service_name      = "${var.common_name}-prod_service"
  image             = var.image
  execution_role    = data.aws_iam_role.ecsTaskExecutionRole.arn

  private_subnets   = [module.private_subnet_1a.ids, module.private_subnet_1b.ids]
  ecs_sg            = module.prod_private_sg.sg_id
  target_group_arn  = module.prod_alb.target_group_arn
}
