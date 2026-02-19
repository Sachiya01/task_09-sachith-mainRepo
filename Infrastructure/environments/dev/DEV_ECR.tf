module "dev_ecr" {
  source = "../../modules/ECR"
  repo_name = "${var.common_name}-dev_ecr"
  scan_on_push = true

  tags = {
    Environment = "dev"
  }
}