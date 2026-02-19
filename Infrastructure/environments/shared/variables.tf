variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "aws_az" {
  description = "List of availability zones"
  type        = string
}

#Shared_VPC
variable "common_name" {
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
  type        = string
}

variable "pvt_sub_cidr" {
  description = "Private subnet CIDR blocks"
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

# EC2 - related
variable "pvt_instance_type" {
  description = "Instance type for private EC2"
  type        = string
}

variable "pub_instance_type" {
  description = "Instance type for public EC2"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "key_pair" {
  description = "Key pair name"
  type        = string
}

variable "private_user_data" {
  description = "Path to private instance user-data script"
  type        = string
}

variable "public_user_data" {
  description = "Path to public instance user-data script"
  type        = string
}

variable "dev_vpc_id" {
  
}

variable "dev_vpc_cidr" {
  
}

variable "dev_pvt_rt_id1" {
  
}

variable "dev_pvt_rt_id2" {
  
}

