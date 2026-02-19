output "prod_vpc_id" {
  
  value = module.prod_vpc.vpc_id

}

output "prod_vpc_cidr" {
  value = module.prod_vpc.cidr_block
}