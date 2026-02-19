module "private_ec2_instance" {
  source  = "../../modules/EC2"
  name = "${var.common_name}-jenkins-instance"
  ami = var.ami
  instance_type = var.pvt_instance_type
  key_name      = var.key_pair
subnet_id = module.private_subnet.ids 
  security_groups = [module.private_sg.sg_id]
  public_ip = false
  user_data = var.private_user_data
  iam_instance_profile = data.aws_iam_instance_profile.jenkins_profile.name
}

