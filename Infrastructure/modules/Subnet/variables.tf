variable "vpc_id" { 

    type = string 
    
    }

variable "cidr_block" { 

    type = string 

    }

variable "az" {

    type = string
    default = "us-east-1a"

}


variable "public" {

    default = true 
    type = bool
}

variable "name" { 
    
    type = string
    
}

variable "environment" {
    type = string
    default = "testing"

}

variable "igw_id" { 
    
    type = string
    default = "" 
    
    }   

variable "nat_gw_id" { 
    
    type = string
    default = "" 
    
    }  