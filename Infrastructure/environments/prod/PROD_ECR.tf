module "prod_ecr" {
  source = "../../modules/ECR"
  repo_name = "${var.common_name}-prod_ecr"
  scan_on_push = true

  tags = {
    Environment = "prod"
  }
}