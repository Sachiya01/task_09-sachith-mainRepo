output "dev_vpc_id" {
  
  value = module.dev_vpc.vpc_id

}

output "dev_vpc_cidr" {
  value = module.dev_vpc.cidr_block
}