variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  
}

variable "family" {
  description = "Family name for the ECS task definition"
  type        = string
}

variable "image" {
  description = "Docker image for the ECS task"
  type        = string
}

variable "execution_role" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for the ECS service"
  type        = list(string)
}

variable "ecs_sg" {
  description = "Security group ID for ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the target group for load balancing"
  type        = string
}