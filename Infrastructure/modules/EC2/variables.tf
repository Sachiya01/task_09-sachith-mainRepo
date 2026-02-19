variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "key_name" {}
variable "security_groups" {
  type = list(string)
}
variable "public_ip" {}
variable "name" {}
variable "user_data" {}
variable "iam_instance_profile" {
  default = null
  
}