variable "vpc_id" {
  description = "The VPC ID where the IGW will be attached"
  type        = string
}

variable "name" {
  description = "A prefix name for resources"
  type        = string
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
