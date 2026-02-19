variable "name" {
  description = "Name of the resource"
  type        = string

}
variable "public_subnets" {
  description = "List of public subnet IDs"
}

variable "alb_sg" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string

}