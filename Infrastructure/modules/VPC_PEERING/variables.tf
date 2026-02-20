variable "requester_vpc_id" {}
variable "accepter_vpc_id" {}
variable "requester_cidr" {}
variable "accepter_cidr" {}
variable "requester_route_table_id" {}
variable "name" {
  type = string
}

variable "auto_accept" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}