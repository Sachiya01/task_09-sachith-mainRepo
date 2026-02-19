aws_region = "us-east-1"
aws_az = "us-east-1a"
common_name = "task_09-sachith"
vpc_cidr = "10.0.0.0/16"
environment = "Shared"
pub_sub_cidr = "10.0.1.0/24"
pvt_sub_cidr = "10.0.2.0/24"
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
    from_port   = 13353
    to_port     = 13353
    protocol    = "udp"
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
    source_sg       = "public" 
  },

  {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    source_sg       = "public" 
  },

  {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
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

pvt_instance_type = "t3.medium"
pub_instance_type = "t3.micro"

ami      = "ami-0b6c6ebed2801a5cb"
key_pair = "tf_sachith"

private_user_data = "C:\\Users\\SachithLiyanage\\Desktop\\Task09-test\\Infrastructure\\userdata\\private_user_data.sh"
public_user_data  = "C:\\Users\\SachithLiyanage\\Desktop\\Task09-test\\Infrastructure\\userdata\\public_user_data.sh"

