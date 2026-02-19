variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "aws_az" {
  description = "List of availability zones"
}

#Shared_VPC
variable "common_name" {
  description = "Common name for shared resources"
  type        = string
}

variable "common_name1" {
  description = "Common name for shared resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

#Subnets
variable "pub_sub_cidr" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "pvt_sub_cidr" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}


variable "shared_vpc_cidr" {
  description = "CIDR block for shared VPC"
  type        = string
}
#PUBLIC SG RULES
variable "public_sg_ingress_rules" {
  description = "Ingress rules for public security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])
  }))
}

variable "public_sg_egress_rules" {
  description = "Egress rules for public security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])  
  }))
}

#PRIVATE SG RULES
variable "private_sg_ingress_rules" {
  description = "Ingress rules for private security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])
     source_sg = optional(string, null)  # custom attribute to indicate source SG
  }))
}

variable "private_sg_egress_rules" {
  description = "Egress rules for private security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])
    source_sg = optional(string, null)  
  }))
}


#alb sg rules
variable "alb_sg_ingress_rules" {
  description = "Ingress rules for ALB security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])
  }))
}

variable "alb_sg_egress_rules" {
  description = "Egress rules for ALB security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string), [])
    security_groups = optional(list(string), [])
  }))
}  

variable "family" {
  description = "Family name for the ECS task definition"
  type        = string  

} 

variable "image" {
  description = "Docker image for the ECS task"
}

