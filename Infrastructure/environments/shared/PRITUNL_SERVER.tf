module "public_ec2_instance" {
  source  = "../../modules/EC2"
  name = "${var.common_name}-pritunl-instance"
  ami = var.ami
  instance_type = var.pub_instance_type
  key_name      = var.key_pair
subnet_id = module.public_subnet.ids 
  security_groups = [module.public_sg.sg_id]
  public_ip = true
  user_data = var.public_user_data
  iam_instance_profile = null
}
