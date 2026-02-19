resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  user_data     = file(var.user_data)

  vpc_security_group_ids = var.security_groups

  associate_public_ip_address = var.public_ip

  tags = {
    Name = var.name
  }
}
