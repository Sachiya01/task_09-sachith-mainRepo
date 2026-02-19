aws_region = "us-east-1"
aws_az = ["us-east-1a", "us-east-1b"]
common_name = "task_09-sachith"
common_name1 = "task-09-sachith"
vpc_cidr = "10.1.0.0/16"
environment = "Development"
pub_sub_cidr = ["10.1.0.0/24", "10.1.16.0/24"]
pvt_sub_cidr = ["10.1.128.0/24", "10.1.144.0/24"]
shared_vpc_cidr = "10.0.0.0/16"
public_sg_ingress_rules = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
public_sg_egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

private_sg_ingress_rules = [
  {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks = [ "10.0.2.0/24" ]
  },
  {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["10.1.0.0/16"]
}

]
private_sg_egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]  
  }
]

alb_sg_ingress_rules = [ {
  
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]  
  
}]
alb_sg_egress_rules = [ {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = [ "0.0.0.0/0" ]  
}
]

family = "dev_task"
image = "nginx:latest"
