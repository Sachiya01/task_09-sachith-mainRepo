output "shared_vpc_id" {
  
  value = module.shared_vpc.vpc_id

}

output "shared_vpc_cidr" {
  value = module.shared_vpc.cidr_block
}