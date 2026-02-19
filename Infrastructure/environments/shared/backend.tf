terraform {
  
  backend "s3" {
    bucket = "task09-sachith-tfbackends"
    key = "shared/terraform.tfstate"
    region = "us-east-1"   
    encrypt = true
  }
}